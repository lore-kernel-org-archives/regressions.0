Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1C64DC61
	for <regressions@lists.linux.dev>; Tue,  1 Aug 2023 16:22:06 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fe10f0f4d1so9667129e87.0
        for <regressions@lists.linux.dev>; Tue, 01 Aug 2023 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690906925; x=1691511725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fa14OZp7rZiZDIhBtcOm5m5ittGDpO+zhxFAVaHECE4=;
        b=JL8g5/y9I33/oNzkxg7EH5w+gbS8zuHQh0tFNNx68xix2ke0VZBiviLz24yO2LISHS
         VJaPE3Ce7aC2nhdVwj0TWo8q2fif2yqnasPgWLi7Wv+LO9Zh4mypaD8OdtsssIhd42fL
         FSDLd5wAfpN/i1tOfO9cDw/WQVgTiouUOT9snSH4FTT5f56amqH6hNKyv100D55k3MQN
         Ba3ugD3nTRX1T7zH1/HEOcUSFG2UQuYXD0QFw0SErirTMZ/jDSxQF+MSxwZevfYmlDdq
         kT/Lxqk7zZuOVSTcmE0VH95Y1p9kBOL5PqiuaFGHqNcpDD9OKBEHtiGx/CXAYJvgFDoB
         IMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690906925; x=1691511725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fa14OZp7rZiZDIhBtcOm5m5ittGDpO+zhxFAVaHECE4=;
        b=UxlDOKxWOq+FRB0wmPF2ieeHFPPNcKR/atNWAEZ/kflP0EB9/UCQjyXJpgj8To6x9r
         roHi/SEX/BQueEbWv4O0MzbzNQEH94K88awCyYIkiazFK3RLW0AF3SQ3GhOmceFlfEjm
         xi6Kv5wJlOWxqDCk//TwTSyCQRUSrxG2hLuUEZYd1MVUG3YKJxqTJCIiAFgXuEsE0bH+
         KFp7cyjPTrVk0cicJ3Gcs/+Hd4QM5okCK5C3Yfg6UxT7rFGQFP9vN3h1SkNNnj8vz/rl
         P27C93A93wQb4+znuOZnMkUOF2WpaZL7C3JT6RaDki3cufNQ8KPq7UJ8SFzc8rWxADCd
         n2Nw==
X-Gm-Message-State: ABy/qLafWp9AgZVLOLcb/niI3S1VivTlezvOcaLefBY3j2Hty5ou6RfP
	e9/XCju8xGRXJXjKU710068=
X-Google-Smtp-Source: APBJJlGhQEO6/R7MPu1WrL22wHozLYu83ROCRFN57aZ+fXe/2xgLksa2WKA0jedgldf+ap2UYHbrpA==
X-Received: by 2002:a05:6512:32a9:b0:4fd:d18e:be33 with SMTP id q9-20020a05651232a900b004fdd18ebe33mr2306477lfe.26.1690906924415;
        Tue, 01 Aug 2023 09:22:04 -0700 (PDT)
Received: from localhost ([2a00:23c5:dc8c:8701:1663:9a35:5a7b:1d76])
        by smtp.gmail.com with ESMTPSA id n5-20020a7bc5c5000000b003fbe4cecc3bsm17338279wmk.16.2023.08.01.09.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 09:22:03 -0700 (PDT)
Date: Tue, 1 Aug 2023 17:22:03 +0100
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-fsdevel@vger.kernel.org,
	Jiri Olsa <olsajiri@gmail.com>, Will Deacon <will@kernel.org>,
	Mike Galbraith <efault@gmx.de>, Mark Rutland <mark.rutland@arm.com>,
	wangkefeng.wang@huawei.com, catalin.marinas@arm.com,
	ardb@kernel.org, David Hildenbrand <david@redhat.com>,
	Linux regression tracking <regressions@leemhuis.info>,
	regressions@lists.linux.dev, Matthew Wilcox <willy@infradead.org>,
	Liu Shixin <liushixin2@huawei.com>, Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>, stable@vger.kernel.org
Subject: Re: [PATCH] fs/proc/kcore: reinstate bounce buffer for KCORE_TEXT
 regions
Message-ID: <786c095e-abca-4bbf-9d9b-684c40e17e1b@lucifer.local>
References: <20230731215021.70911-1-lstoakes@gmail.com>
 <ZMkrfBDARIAYFYwz@MiWiFi-R3L-srv>
 <ZMksTC6pewXDgkFe@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMksTC6pewXDgkFe@MiWiFi-R3L-srv>

On Wed, Aug 02, 2023 at 12:01:16AM +0800, Baoquan He wrote:
> On 08/01/23 at 11:57pm, Baoquan He wrote:
> > On 07/31/23 at 10:50pm, Lorenzo Stoakes wrote:
> > > Some architectures do not populate the entire range categorised by
> > > KCORE_TEXT, so we must ensure that the kernel address we read from is
> > > valid.
> > >
> > > Unfortunately there is no solution currently available to do so with a
> > > purely iterator solution so reinstate the bounce buffer in this instance so
> > > we can use copy_from_kernel_nofault() in order to avoid page faults when
> > > regions are unmapped.
> > >
> > > This change partly reverts commit 2e1c0170771e ("fs/proc/kcore: avoid
> > > bounce buffer for ktext data"), reinstating the bounce buffer, but adapts
> > > the code to continue to use an iterator.
> > >
> > > Fixes: 2e1c0170771e ("fs/proc/kcore: avoid bounce buffer for ktext data")
> > > Reported-by: Jiri Olsa <olsajiri@gmail.com>
> > > Closes: https://lore.kernel.org/all/ZHc2fm+9daF6cgCE@krava
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
> > > ---
> > >  fs/proc/kcore.c | 26 +++++++++++++++++++++++++-
> > >  1 file changed, 25 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
> > > index 9cb32e1a78a0..3bc689038232 100644
> > > --- a/fs/proc/kcore.c
> > > +++ b/fs/proc/kcore.c
> > > @@ -309,6 +309,8 @@ static void append_kcore_note(char *notes, size_t *i, const char *name,
> > >
> > >  static ssize_t read_kcore_iter(struct kiocb *iocb, struct iov_iter *iter)
> > >  {
> > > +	struct file *file = iocb->ki_filp;
> > > +	char *buf = file->private_data;
> > >  	loff_t *fpos = &iocb->ki_pos;
> > >  	size_t phdrs_offset, notes_offset, data_offset;
> > >  	size_t page_offline_frozen = 1;
> > > @@ -554,11 +556,22 @@ static ssize_t read_kcore_iter(struct kiocb *iocb, struct iov_iter *iter)
> > >  			fallthrough;
> > >  		case KCORE_VMEMMAP:
> > >  		case KCORE_TEXT:
> > > +			/*
> > > +			 * Sadly we must use a bounce buffer here to be able to
> > > +			 * make use of copy_from_kernel_nofault(), as these
> > > +			 * memory regions might not always be mapped on all
> > > +			 * architectures.
> > > +			 */
> > > +			if (copy_from_kernel_nofault(buf, (void *)start, tsz)) {
> > > +				if (iov_iter_zero(tsz, iter) != tsz) {
> > > +					ret = -EFAULT;
> > > +					goto out;
> > > +				}
> > >  			/*
> > >  			 * We use _copy_to_iter() to bypass usermode hardening
> > >  			 * which would otherwise prevent this operation.
> > >  			 */
> > > -			if (_copy_to_iter((char *)start, tsz, iter) != tsz) {
> > > +			} else if (_copy_to_iter(buf, tsz, iter) != tsz) {
> > >  				ret = -EFAULT;
> > >  				goto out;
> > >  			}
> > > @@ -595,6 +608,10 @@ static int open_kcore(struct inode *inode, struct file *filp)
> > >  	if (ret)
> > >  		return ret;
> > >
> > > +	filp->private_data = kmalloc(PAGE_SIZE, GFP_KERNEL);
> > > +	if (!filp->private_data)
> > > +		return -ENOMEM;
> > > +
> > >  	if (kcore_need_update)
> > >  		kcore_update_ram();
> > >  	if (i_size_read(inode) != proc_root_kcore->size) {
> > > @@ -605,9 +622,16 @@ static int open_kcore(struct inode *inode, struct file *filp)
> > >  	return 0;
> > >  }
> > >
> > > +static int release_kcore(struct inode *inode, struct file *file)
> > > +{
> > > +	kfree(file->private_data);
> > > +	return 0;
> > > +}
> > > +
> > >  static const struct proc_ops kcore_proc_ops = {
> > >  	.proc_read_iter	= read_kcore_iter,
> > >  	.proc_open	= open_kcore,
> > > +	.proc_release	= release_kcore,
> > >  	.proc_lseek	= default_llseek,
> > >  };
> >
> > On 6.5-rc4, the failures can be reproduced stably on a arm64 machine.
> > With patch applied, both makedumpfile and objdump test cases passed.
> >
> > And the code change looks good to me, thanks.
> >
> > Tested-by: Baoquan He <bhe@redhat.com>
> > Reviewed-by: Baoquan He <bhe@redhat.com>

Thanks!

> >
> >
> > ===============================================
> > [root@ ~]# makedumpfile --mem-usage /proc/kcore
> > The kernel version is not supported.
> > The makedumpfile operation may be incomplete.
> >
> > TYPE		PAGES			EXCLUDABLE	DESCRIPTION
> > ----------------------------------------------------------------------
> > ZERO		76234           	yes		Pages filled with zero
> > NON_PRI_CACHE	147613          	yes		Cache pages without private flag
> > PRI_CACHE	3847            	yes		Cache pages with private flag
> > USER		15276           	yes		User process pages
> > FREE		15809884        	yes		Free pages
> > KERN_DATA	459950          	no		Dumpable kernel data
> >
> > page size:		4096
> > Total pages on system:	16512804
> > Total size on system:	67636445184      Byte
> >
> > [root@ ~]# objdump -d  --start-address=0x^C
> > [root@ ~]# cat /proc/kallsyms | grep ksys_read
> > ffffab3be77229d8 T ksys_readahead
> > ffffab3be782a700 T ksys_read
> > [root@ ~]# objdump -d  --start-address=0xffffab3be782a700 --stop-address=0xffffab3be782a710 /proc/kcore
> >
> > /proc/kcore:     file format elf64-littleaarch64
> >
> >
> > Disassembly of section load1:
> >
> > ffffab3be782a700 <load1+0x41a700>:
> > ffffab3be782a700:	aa1e03e9 	mov	x9, x30
> > ffffab3be782a704:	d503201f 	nop
> > ffffab3be782a708:	d503233f 	paciasp
> > ffffab3be782a70c:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
> > objdump: error: /proc/kcore(load2) is too large (0x7bff70000000 bytes)
> > objdump: Reading section load2 failed because: memory exhausted
>
> By the way, I can still see the objdump error saying kcore is too large
> as above, at the same time there's console printing as below. Haven't
> checked it's objdump's issue or kernel's.
>
> [ 6631.575800] __vm_enough_memory: pid: 5321, comm: objdump, not enough memory for the allocation
> [ 6631.584469] __vm_enough_memory: pid: 5321, comm: objdump, not enough memory for the allocation
>

Yeah this issue existed before this patch was applied on arm64, apparently
an ancient objdump bug according to the other thread [0]. I confirmed it
exists on v6.0 kernel for instance.

[0]:https://lore.kernel.org/all/7b94619ad89c9e308c7aedef2cacfa10b8666e69.camel@gmx.de/
