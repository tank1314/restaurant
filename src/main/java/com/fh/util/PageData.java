package com.fh.util;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
/** 
 * 说明：参数封装Map
 * 创建人：FH Q313596790
 * 修改时间：2014年9月20日
 * @version
 */
public class PageData extends HashMap implements Map{
	
	private static final long serialVersionUID = 1L;
	
	Map map = null;
	HttpServletRequest request;
	public PageData(HttpServletRequest request){
		this.request = request;
		Map properties = request.getParameterMap();
		Map returnMap = new HashMap(); 
		Iterator entries = properties.entrySet().iterator(); 
		Map.Entry entry; 
		String name = "";  
		String value = "";  
		while (entries.hasNext()) {
			entry = (Map.Entry) entries.next(); 
			name = (String) entry.getKey(); 
			Object valueObj = entry.getValue(); 
			if(null == valueObj){ 
				value = ""; 
			}else if(valueObj instanceof String[]){ 
				String[] values = (String[])valueObj;
				for(int i=0;i<values.length;i++){ 
					 value = values[i] + ",";
				}
				value = value.substring(0, value.length()-1); 
			}else{
				value = valueObj.toString(); 
			}
			returnMap.put(name, value); 
		}
		map = returnMap;
	}
	
	public PageData() {
		map = new HashMap();
	}
	
	@Override
	public Object get(Object key) {
		Object obj = null;
		if(map.get(key) instanceof Object[]) {
			Object[] arr = (Object[])map.get(key);
			obj = request == null ? arr:(request.getParameter((String)key) == null ? arr:arr[0]);
		} else {
			obj = map.get(key);
		}
		return obj;
	}
	
	public String getString(Object key) {
		return (String)get(key);
	}

    /**
     * modify by tan.kun@niuhome.com
     * @param name
     * @return
     */
    public double getDouble(String name) {
        if ((name == null) || (name.equals(""))) {
            return 0.0D;
        }
        double value = 0.0D;
        if (!containsKey(name)) {
            return 0.0D;
        }
        Object obj = get(name);
        if (obj == null) {
            return 0.0D;
        }
        if (!(obj instanceof Double)) {
            try {
                value = Double.parseDouble(obj.toString());
            }
            catch (Exception ex) {
                value = 0.0D;
            }
        } else {
            value = ((Double)obj).doubleValue();
            obj = null;
        }

        return value;
    }

    /**
     * modify by tan.kun@niuhome.com
     * @param name
     * @return
     */
    public float getFloat(String name) {
        if ((name == null) || (name.equals(""))) {
            return 0.0F;
        }
        float value = 0.0F;
        if (!containsKey(name)) {
            return 0.0F;
        }
        Object obj = get(name);
        if (obj == null) {
            return 0.0F;
        }
        if (!(obj instanceof Float)) {
            try {
                value = Float.parseFloat(obj.toString());
            }
            catch (Exception ex) {
                value = 0.0F;
            }
        } else {
            value = ((Float)obj).floatValue();
            obj = null;
        }

        return value;
    }
    /**
     * modify by tankun
     * @param name
     * @return
     */
    public int getInt(String name)
    {
        if ((name == null) || (name.equals(""))) {
            return 0;
        }
        int value = 0;
        if (!containsKey(name)) {
            return 0;
        }
        Object obj = get(name);
        if (obj == null) {
            return 0;
        }
        if (!(obj instanceof Integer)) {
            try {
                value = Integer.parseInt(obj.toString());
            }
            catch (Exception ex) {
                value = 0;
            }
        } else {
            value = ((Integer)obj).intValue();
            obj = null;
        }

        return value;
    }
	
	@SuppressWarnings("unchecked")
	@Override
	public Object put(Object key, Object value) {
		return map.put(key, value);
	}
	
	@Override
	public Object remove(Object key) {
		return map.remove(key);
	}

	public void clear() {
		map.clear();
	}

	public boolean containsKey(Object key) {
		// TODO Auto-generated method stub
		return map.containsKey(key);
	}

	public boolean containsValue(Object value) {
		// TODO Auto-generated method stub
		return map.containsValue(value);
	}

	public Set entrySet() {
		// TODO Auto-generated method stub
		return map.entrySet();
	}

	public boolean isEmpty() {
		// TODO Auto-generated method stub
		return map.isEmpty();
	}

	public Set keySet() {
		// TODO Auto-generated method stub
		return map.keySet();
	}

	@SuppressWarnings("unchecked")
	public void putAll(Map t) {
		// TODO Auto-generated method stub
		map.putAll(t);
	}

	public int size() {
		// TODO Auto-generated method stub
		return map.size();
	}

	public Collection values() {
		// TODO Auto-generated method stub
		return map.values();
	}
	
}
