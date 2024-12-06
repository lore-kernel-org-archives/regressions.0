Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AEA1F03D5
	for <regressions@lists.linux.dev>; Fri,  6 Dec 2024 09:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478612; cv=none; b=DqxAC2iV4ENBtTHUYDFCSO8Q3OtCGFOIrQuTsfhF1KH/xrvP6ZL7n0ME4h4nilNM03nUtfgDKafXmUsB1sLPhhOgtXFGqFMTu6gNMb2n6U7arnEwskm2dPgon0WXcOUSZINcIE/r1VWFYaa+VagwMEPLqicEq81v1TJpyaoHxmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478612; c=relaxed/simple;
	bh=1uD5v117Fa4KG6vtOWwtVXwvW6ArpBIGQlVxica/Arw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYHZPJR13uVsSp8avCNRiHlsy7QMJBS10sp2oFjEmcDmLTKCvuV0rav44fDjkUQzjrpXfxkv/Eudqc4nC5ZadytdGU/nDMvws1lQKQl6SOEWdUO9Gwy0LGhdoTh99pgvfEl55fpbpseNN0VjUQBcnJSBTOhWdhx8ejjxrWYpOCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NUMj0NKW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NUMj0NKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733478609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lE5tEKz/D5+Er50MF/ZmiVGM13PEQEliYqeWHoOSUe0=;
	b=NUMj0NKWdFQ4LbkOlYVsEBlRxV/f8TnL/HHP2TZAHoIcc/8uppejtlSQju1+cR9rzgQv05
	0c1IkkAD7E6xd0ucrxnMbKEcMA5h1uGKnlrnulSgpNSzLNpMikuSz2X3OIJCd4doeauQT5
	JvUA7AizyD7BbUrfGMRwYOJGJavu+kA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-QhNOKVi3OnSNATvi6j9gbw-1; Fri, 06 Dec 2024 04:50:05 -0500
X-MC-Unique: QhNOKVi3OnSNATvi6j9gbw-1
X-Mimecast-MFC-AGG-ID: QhNOKVi3OnSNATvi6j9gbw
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-434a51e44d0so15726435e9.3
        for <regressions@lists.linux.dev>; Fri, 06 Dec 2024 01:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478604; x=1734083404;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lE5tEKz/D5+Er50MF/ZmiVGM13PEQEliYqeWHoOSUe0=;
        b=G9ZiHZGYz/5Ccj3sX1mHMykigR7lwEEVxBSpdBEH0NynaVB1DtEJW+4llIQIORCwzw
         CJiZe9yh2/Saficij9OvEyhKtYWx+B7bgFyUoRsFdj3ZCQqMDEB7MwBVGoMfjfPMSxYP
         en8yzhCvIfNsdAQQqqikXYyW476h3zMYiyJTe8W0reWi64ZgGaHP1yGha51ru+j+NL6L
         odsmNKfMhrCjK7wao0WGp1LTmupW/No8Ol6UWkwK+pubNwdL+tLUPkhUnZtyItWngetF
         ABJoW8tngFiLXZro7VsGLTq7yVk/KKc/w+gxH/3TJPfaGM+56rKQJs1qfzC8+B3NuIdX
         QRSg==
X-Gm-Message-State: AOJu0YwYb/3x0ZZvcDeCXGX6VF5hMxgv0uX9N51eXMEZQlX0nyWRbW/a
	1oYMJnCeAIv2tuSu+fsHWq5c3rSa3uZPFG9IdFvyIADEmRdsmnsElAaIkdBi6ioft/UzTude+Rn
	CZcrCf1RkFHLXWEytXdbxSmdn4Z/93lcKECUzqVx4FEV/1xiGwq9QZtki2XIl
X-Gm-Gg: ASbGncvCo7Jzb2pOfQD+x1ZKgPtc2/AsZ1nyAzLx1b5xnBlJebgm0D0YPfdNmL/9hoc
	jl1X9TZSMHz410/htIzdusfrYaagJvR/YBAPE4ndamcrdpjM1D1JDYQbcT03HaTrecpZHaL7iB1
	NNFiWIQJJlX3Jv99jwkHXFw4epU89zzMNT6v2BtFQ4h/EmAf8QRTTyzpFcwEB1o47daPzUcdil7
	1T45cmmdR07abge/TSfOTyHIOhMBPqZ/0FqXWDGIESrhOQTFHdcAuSjC+SLhYBVAh+theYLFJyp
	y32ujKKYGwY3nkDNsUrrkKzNCg6U/k2TJGNsKye8Yq9IBhoSnygnJMtwFJrCbqu2TubcrjBXdmT
	xFg==
X-Received: by 2002:a05:600c:4eca:b0:434:da26:e318 with SMTP id 5b1f17b1804b1-434ddedbc13mr17241715e9.33.1733478604508;
        Fri, 06 Dec 2024 01:50:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2fFeFeaREOL2Cgmf8ROG7xnApL/YGHUwfs2YTTB+iW7icRGm+ReNlAayJGCsX6vcbmZo/Yw==
X-Received: by 2002:a05:600c:4eca:b0:434:da26:e318 with SMTP id 5b1f17b1804b1-434ddedbc13mr17241545e9.33.1733478604155;
        Fri, 06 Dec 2024 01:50:04 -0800 (PST)
Received: from ?IPV6:2003:cb:c71b:d000:1d1f:238e:aeaf:dbf7? (p200300cbc71bd0001d1f238eaeafdbf7.dip0.t-ipconnect.de. [2003:cb:c71b:d000:1d1f:238e:aeaf:dbf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d6bbfsm52574575e9.16.2024.12.06.01.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 01:50:03 -0800 (PST)
Message-ID: <81b0b8bf-632f-4f71-8357-41ebf7421919@redhat.com>
Date: Fri, 6 Dec 2024 10:50:01 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] 6.13-rc1: Loading nvme module leads to
 mm/page_alloc.c:4727 __alloc_pages_noprof+0x321/0x330
To: Simon Polack <spolack@mailbox.org>, kbusch@kernel.org, hch@lst.de,
 linux-mm@kvack.org
Cc: regressions@lists.linux.dev, linux-nvme@lists.infradead.org,
 'linux-kernel@vger.kernel.org
References: <5fcdfd16-d598-4a86-962e-9d22b0524b12@mailbox.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <5fcdfd16-d598-4a86-962e-9d22b0524b12@mailbox.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zOSTidpUzkgy1YejejbRNpUxyfGy1YubeHjs8_epANM_1733478604
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.12.24 11:59, Simon Polack wrote:
> Hello,
> 
> i noticed a regression after upgrading from 6.12.1 to 6.13-rc1. The logs
> indicate a error in mm/page_alloc.c which is called from the nvme
> module. Other modules seem to be not producing that warning, therefore i
> have included nvme maintainers as well.
> 
> The issue is seen on a Dell Latitude 5340 Notebook which is runnning
> Fedora 41 using vanilla kernel and the system seems to be still
> perfectly working, aside from the call trace.
> 
> Please bare with me in case i forgot to include relevant recipients or
> deviate from the exact process, as this is my first reported issue.
> 
> Best,
> Simon
> 
> 
> CPU Model:
> 13th Gen Intel(R) Core(TM) i5-1345U
> 
> Affected Release:
> Linux version 6.13.0-0.rc1.20241203gtcdd30ebb.314.vanilla.fc41.x86_64
> (mockbuild@51edd079414046e884973245b9e58270) (gcc (GCC) 14.2.1 20240912
> (Red Hat 14.2.1-3), GNU ld version 2.43.1-2.fc41) #1 SMP PREEMPT_DYNAMIC
> Tue Dec  3 07:44:07 UTC 2024
> 
> Last known good release:
> Linux fedora 6.12.1-400.vanilla.fc41.x86_64 #1 SMP PREEMPT_DYNAMIC Fri
> Nov 22 16:32:03 UTC 2024 x86_64 GNU/Linux
> 
> 
> Related logs:
> [    2.301170] nvme 0000:01:00.0: platform quirk: setting simple suspend
> [    2.301276] nvme nvme0: pci function 0000:01:00.0
> [..]
> [    2.325090] ------------[ cut here ]------------
> [    2.325094] WARNING: CPU: 7 PID: 206 at mm/page_alloc.c:4727
> __alloc_pages_noprof+0x321/0x330

This seems to be the

         if (WARN_ON_ONCE_GFP(order > MAX_PAGE_ORDER, gfp))
                 return NULL;

In that case, NVME is requesting an impossible allocation.

-- 
Cheers,

David / dhildenb

