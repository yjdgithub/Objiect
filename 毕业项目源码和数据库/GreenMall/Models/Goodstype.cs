//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace GreenMall.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Goodstype
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Goodstype()
        {
            this.Goodstype1 = new HashSet<Goodstype>();
            this.Shopinginfo = new HashSet<Shopinginfo>();
        }
    
        public int ID { get; set; }
        public string Typename { get; set; }
        public Nullable<int> Pid { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Goodstype> Goodstype1 { get; set; }
        public virtual Goodstype Goodstype2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Shopinginfo> Shopinginfo { get; set; }
    }
}
