Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB9E22301
	for <regressions@lists.linux.dev>; Tue, 13 Jan 2026 21:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338954; cv=none; b=EXygru20VQCY1OuDNQOH/3oj4BG995cIGiTghUrPWHciXdDWLF2YZPggygEAfY1FMCwS4zx4Pp7ijEJIP/8PISDfbkgU1M0cYob4V8n37X+3LSWrey7Jnfp9wLfVRJyvTezdoK0aEghQ/TysoOawa91ajAuddmfJxRAYs3wHpww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338954; c=relaxed/simple;
	bh=lSiT+5f78IAghqqameTuBM0ImkHpqh4OyDDkmFOfoGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rV9BwkfjQGW7RRLN0jVtU8yzhuxBeYbzQUkOXC2ESmBxOhCJbtZVUhTfPWZhouDlC2RHzLVj0TT0FMjWeAUVUTeLksxb/r9TXBGnkaX7wAzlZaHC+a17c1lUt46n3sMOiZDY1lBo6iHqhZBCl8vxaxgAI4wQrF03IH/+cwgryE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=D7uK8nHA; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="D7uK8nHA"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ed66b5abf7so2481351cf.1
        for <regressions@lists.linux.dev>; Tue, 13 Jan 2026 13:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768338951; x=1768943751; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8S7FI6sNOOKEC+zXX9NqKGAvEksfTGrqIkrYgB7KQ6g=;
        b=D7uK8nHAMXfftT63OsJ3l+LYcey3qBfshbB5b0PvHIyw5i1kX1HL6rkqpwXIUapYpE
         Ao98GaI7gUsv9lw/ho5P3PMSmJ26T4aYOMMQgfycUXKGgXTBoXvALnD3wneg+FL6W5J1
         1Zs6+IHgAbPoAry9NAfIszsiNNPsuVgLZT0Z30YFi8RxhMITqXcUrDR5luZLmw7jHwMY
         vTKJhM8D2mvho11jdHqJWZHFolepLgDU7U44X072DYpQQq9YWOITYmWPDwelscc/LQAv
         mOZnNcyqr50BqDRCNlb/IYV1uSyse1dheM6GRHmvnb5xtX5hVOwwRw+B0CHk9e/DRuj8
         Hq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768338951; x=1768943751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8S7FI6sNOOKEC+zXX9NqKGAvEksfTGrqIkrYgB7KQ6g=;
        b=gkTHMypLlhQDcAbslNBfHfLj7hJdf25Qm7tUaAVHLJrWIelDAUUoWUylm6BhsNZ6El
         xLXtrXyJzNfoDXHQJQXATJZkaMaVVrCFcD64Qn3xKV0yR+WDlNYMfgCcnwjkxIPpiy8V
         jgayyaxHb4VUNtw3QGgbgBYF+drk6P70ISRpWNsVaA9f9BzlUoTanY4O9Jr3VgH7W9bj
         opU50V4Yx0rC/2MZIr1afQCuL4+CWa32rWo1TwFNGKU5+BAIOd3tYTiX26H3oo/cEVVU
         fPI4N9PPGgnNHnm+TjXTlVuU7V7vhD2ISo30XNeRZnN7kycGd29uMnqfkhThh0fwHzYD
         cdqw==
X-Forwarded-Encrypted: i=1; AJvYcCUgbK1UEIzptipOIS7WQhvBuNbU7FabroznTuiQBte96t1pqO1NCjMQyKImaKcL78VMgxRFxePl21m6OA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/A6kjTHvxeBYJTV5PZYBZpj+Ri4vhG6alHnZ+gDp17IoUX8TQ
	S9n7M9RZKbEBYJlHxw+vCxOwunKlTbMnOvww25vyFdMtRxCoBVvZ7mcGewMIIQHlMB4=
X-Gm-Gg: AY/fxX6V1AE9L37RGsHsk0C77HbYHD7QUgqcv4fP1KOY6yPNV3TWnTvl1cpA8vtIpfm
	OTD0XFmJr+BSMv51Fy23JSdmR9ZvJ7iFO9xJ9zYJpHHfUpQfqa/WfYe1NzjB5edlH2VRUKjEFsS
	UPeNzzs9Vfrum3Ddpj1hXbz9QCd3rm1ARu/HLByt3GoKcdzdc1IQvTijcdEgzak1pZjTmxO8mEb
	FucV8mRxrWx6iZWEWaixsb9ex81zPYXmCeBiqu/dYUjP339BQWESrY0gG4oMBzfH8mgRFpcodEY
	aPgTL7nbif+05beO45z3brKOa63Um6WaOM9JuRaXsDvNHlBF8D+O5tOwQLMWj8KyhEaDKn0Lusx
	Kn8bs5eWFz4Sb+cGT7RUATkuUMTg192aYd4K4pVH/L7M1BtoLrvCaLsiy5eDOstJ8CX/4OFlUwJ
	LQJKCBUc2nMTiMjzyt+N3ADZMBxT7jUhxcQTKW75tWwlzUVWyywSKuUmW55BHBbu4A5CU=
X-Received: by 2002:a05:622a:19aa:b0:4f1:de87:ad90 with SMTP id d75a77b69052e-5013972ec7emr56793941cf.4.1768338951296;
        Tue, 13 Jan 2026 13:15:51 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772682besm164113626d6.50.2026.01.13.13.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:15:50 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfljw-000000040dN-3h50;
	Tue, 13 Jan 2026 17:15:48 -0400
Date: Tue, 13 Jan 2026 17:15:48 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Bert Karwatzki <spasswolf@web.de>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	regressions@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Yury Norov <yury.norov@gmail.com>,
	Anna Schumaker <anna.schumaker@oracle.com>,
	Baoquan He <bhe@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
	Dave Young <dyoung@redhat.com>,
	Doug Anderson <dianders@chromium.org>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@kernel.org>,
	Joanthan Cameron <Jonathan.Cameron@huawei.com>,
	Joel Granados <joel.granados@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Kees Cook <kees@kernel.org>, Li Huafei <lihuafei1@huawei.com>,
	"Luck, Tony" <tony.luck@intel.com>,
	Luo Gengkun <luogengkun@huaweicloud.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	Nam Cao <namcao@linutronix.de>, oushixiong <oushixiong@kylinos.cn>,
	Petr Mladek <pmladek@suse.com>,
	Qianqiang Liu <qianqiang.liu@163.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Sohil Mehta <sohil.mehta@intel.com>, Tejun Heo <tj@kernel.org>,
	Thomas Zimemrmann <tzimmermann@suse.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>, W_Armin@gmx.de
Subject: Re: NMI stack overflow during resume of PCIe bridge with
 CONFIG_HARDLOCKUP_DETECTOR=y
Message-ID: <20260113211548.GV745888@ziepe.ca>
References: <20260113094129.3357-1-spasswolf@web.de>
 <87h5spk01t.ffs@tglx>
 <bc20529d7520e7db7de2022bf9c96a1bc3a2f0df.camel@web.de>
 <87v7h5ia3d.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7h5ia3d.ffs@tglx>

On Tue, Jan 13, 2026 at 08:30:46PM +0100, Thomas Gleixner wrote:
> So gradually your machine just stalls on outstanding MMIO transactions
> w/o further notice... The NMI is just a red herring.

CPUs usualy have timeouts for these things and they return 0xFF back
for the timed out read. Beyond that "it depends" if any other RAS
indications are raised.
 
> You need to figure out why that MMIO access to that device's
> configuration space stalls as anything else is just subsequent
> damage.

Given this is a resume it seems likely the PCI routing inside the
bridge chip has been messed up somehow during the suspend/resume.

Possibily due to errata in the bridge, there are many weird bridge
errata :\

Jason
