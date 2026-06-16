Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742A54779BF
	for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 16:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781627813; cv=none; b=FCtkHqXDwT3Q3TV+lLjLB/NxFZkVltcetEBoaTbBEaqHX68Ipc4LAxPBX4sEyr9gfz0IqKiKoexQ91sQL1YO8NJ6mvWJUvaQpmThFiYMsXfAg2aeMKQ3jPQXyzGsx/Yvr3YE5rhC5+XW0MXfqTK6fGR+N/4hS/8PxB+OuwMLy7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781627813; c=relaxed/simple;
	bh=KWyR6lLbfsKyvj+2Veq9+Tz9SdQtZ+iqwrafWa+Suds=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQfcFBI1cMYPUWVEX/mA9q4FBxj0o3XoyKpuzaCL7JWOIs4GzhZB+ot4TrD9Te43+ACjr5DEdYOus/aDb3Hx5pZW0dFKjqftm/H/5rrCUYkk9oz2AUElp6+vLV2eo2/wuVjw8A68w6roqvFS4UyN5INMR6wJavTLs6ATmq7u3/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFqo+bu+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFqo+bu+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4905529b933so47141725e9.0
        for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 09:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781627811; x=1782232611; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFaNAqinUgkXjh92IVLXqIUVWHUv/aOY2jo/+DQ3enI=;
        b=AFqo+bu+MmbToHKqDKD9AU0EtRtO1PO5FH3wZMT5nhUVB0MPcPROh3E6Lebr6cT9MY
         CG5D3fvx3tGCqIUl1c/zXbbRJeLey1p/j/8n28h3OIrlo+/w+ztyIIn6txifXX7ymolL
         X01vACTMTm3BliFimsgUu1eluEeDPMpNFNVgdvr50ZyeAOjAE/Su1+jg71k/rf4z+CrZ
         SUq2dlbPfSr4IqjO3dMvNFefhuWpQ3YizyG8+KYF5VorAeurbg09UESDpDhDg+A/imWX
         loxauGjKftKRCM52Gg4+Rw/etxMAzaDUHt9QaswSt4mFnpVYt3D72jrF/Tu6WWf0/Qpw
         b+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781627811; x=1782232611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HFaNAqinUgkXjh92IVLXqIUVWHUv/aOY2jo/+DQ3enI=;
        b=TsBpA+ocJlDwCXfNZVeN3B8KoQb+OBgix/WuB+VfmFmsIMMKHrdoyEYlT09TRp7Bmx
         kM+lasgKSeTi3qMwGezHumX0l9NQVvzhj2JaTvpv2E2qoJqt4A00WYGbgcr2erLYHbc4
         LiEZ/7UrYzTCRTKwOLp6Wd0vrttKmTfy2I3kfl9WIv285QK7DOzmZ9uYOg1lzDKoz0bb
         PArUKjQnuHB5oqh9p8iYE6sYh6f5AYNjP4dtoo4Doxwt04UL7JkyOsfG3+BhoxLi+rBF
         bTxEXwUpThUsjq7d3Q9OrPLka/mryAcW9A50ITaytCg9xi5fqojErFREfRurVaxAOT5Z
         yxrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/WYBOG+QG08AdYwrtXhRBLvHAQvIoHLTrLCWj306sZ2wdeHqvMbxivV9qCAoOrkrGMyI//3+t4V9J/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYdUOO/DUCwaX5b1gQ6TU8f6yuR063UvU3dKCq5h9CPP90gROz
	C11pUTaL2/YANolEUCROSUEsM+08QLF1olMFwsGFTQFfR7Nqxh2n33vs8Pzoxg==
X-Gm-Gg: Acq92OF4lU6wVBW8ZpI8omVdRM/Ilv3JB+geoP2/EiUyjjJs55bf90cKIAxn3tCP0W3
	UvYkoZPD3YHY5lcNYEWx8G5bXuE5kSuJyalkoAo3q7rtRNKahZtzDaCjt6W2xcxdiI3D0g8CpvL
	1xNRf+584QdYbir3qjBRsMogw7LCpJh7DjE8mBLGFsY1xu7t7TEvbef2bIBksgSnuQvSE8sXlRv
	/Ys7hzfVRIPeWJpZh0zMJ+tZ3pxIYayN72GvzR+HdIPSlYHrzBQoaXw0kg7dBkZZ0cqT5h00VoL
	tXtAjxauMyrNgUOZz/DF99jPrBeD/j3kEOX/nOiCuWT45v5PuaPpgRUbelD1qefeWnDFtDVUh0r
	20y/89SNWCKZycbSaYTc3nitVb4pPnWppFsNLlgfEWTIbLszWcW9RuhR1uQ6WUGeslahdMZqHL6
	myt6J2kQjfZ/35tG9l/Shyk5It3lax9rk3
X-Received: by 2002:a05:600c:19d3:b0:492:2100:aba2 with SMTP id 5b1f17b1804b1-492333ba311mr4589965e9.4.1781627810369;
        Tue, 16 Jun 2026 09:36:50 -0700 (PDT)
Received: from foxbook (bfg19.neoplus.adsl.tpnet.pl. [83.28.44.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f309sm42606551f8f.14.2026.06.16.09.36.49
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jun 2026 09:36:50 -0700 (PDT)
Date: Tue, 16 Jun 2026 18:36:46 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Amin Vakil <info@aminvakil.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, Tao Xue <xuetao09@huawei.com>,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] usb: core: interrupt-IN wBytesPerInterval fixup
 (727d045d064b) breaks RTL8153 in Lenovo dock
Message-ID: <20260616183646.4798516b.michal.pecio@gmail.com>
In-Reply-To: <573bbb08-0ba7-4f00-8996-819cc1d9cc48@aminvakil.com>
References: <cbdeb118-58c7-48a7-94a0-15e5cdb5879c@aminvakil.com>
	<35d2b455-382e-470e-acf4-1ab60770da90@leemhuis.info>
	<5036fee2-4d00-4ca0-aeed-400da64d7872@aminvakil.com>
	<573bbb08-0ba7-4f00-8996-819cc1d9cc48@aminvakil.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Jun 2026 17:38:32 +0330, Amin Vakil wrote:
> I can confirm 7.1 mainline (installed from AUR) still has the problem:
> 
> dmesg (kernel 7.1.0)
> 
>    usb 2-1.1: New USB device found, idVendor=17ef, idProduct=721e, 
> bcdDevice=31.03
>    usbcore: registered new device driver r8152-cfgselector
>    r8152-cfgselector 2-1.1: reset SuperSpeed USB device number 3 using 
> xhci_hcd
>    r8152 2-1.1:1.0 (unnamed net_device) (uninitialized): Invalid header 
> when reading pass-thru MAC addr

Was this junk always here?

>    usbcore: registered new interface driver r8152
>    r8152 2-1.1:1.0 enp0s13f0u1u1: renamed from eth0
>    r8152-cfgselector 2-1.1: USB disconnect, device number 3
>
> >>> Hardware: Lenovo dock built-in Realtek RTL8153, enumerating as
> >>> USB ID 17ef:721e (Lenovo rebrand of 0bda:8153), driven by r8152
> >>> through r8152- cfgselector. Host is an Intel laptop with xhci_hcd.
> >>>
> >>> Symptom: on the patched kernel the NIC enumerates, r8152 binds
> >>> and the netdev is created, then about one second later the device
> >>> is USB- disconnected by r8152-cfgselector and never returns. No
> >>> ethernet interface remains. USB, HDMI and the rest of the dock
> >>> keep working, and plugging the cable straight into the laptop
> >>> built-in NIC is unaffected.
> >>>
> >>> Affected vs working (Arch linux-hardened): 7.0.11.hardened2 works,
> >>> 7.0.12.hardened1 is broken. This commit is the only
> >>> RTL8153/USB-core change in that delta, and it activates a code
> >>> path that did not run before on this device (note the new
> >>> wBytesPerInterval message in the dmesg below, absent on 7.0.11).

RTL8153 was one of the chips specifically targeted by this fix, but
it affects the CDC configuration which you don't seem to be using.

I have tried linux-hardened-7.0.12.hardened1-1-x86_64 from Arch repo
as well as my own build of 7.1-rc6, and my RTL8153 (0bda:8153) in a
different kind of USB-C dock still works with a few xHCI controllers.

So it's some weird problem narrowly specific to your system. Now that
you have built your own kernel, please also revert the suspect patch
to verify if that's really it.

> >>> I can provide the full dmesg and full lsusb -v output on request.

lsusb -v of the NIC may be useful in case it's different from mine.
lsusb -tv of the whole dock, because there are other recent patches
for Lenovo docks and I'm not sure if they apply to yours.

Regards,
Michal
