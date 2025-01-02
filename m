Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241281B414C
	for <regressions@lists.linux.dev>; Thu,  2 Jan 2025 18:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735843124; cv=none; b=J0hnq2ZMqsu1OcjBz0O8Ky0KbSJmlz5QfHHm8tBapIwUNR4gSTJ3pQ7SQycm8PygczfFzyxbkixc8gu4IsC5Cx3ax75GYjA0o0UWS9I0OkYB+TF+JF4bGcloVOgO+VYozSpTw47VwMdw6kr3RLscnr541vl5sMYXBPw03aMymns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735843124; c=relaxed/simple;
	bh=0zqlzsWDfKuygTxYYeINXmJlDOd9Qwxl5HLYWpdOS6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l0VtSQ0J6C5iXqHbjIQgljHMxFc5yk/DFMAbtxc81AqGzwyrMittgOW4lXrVIcVQ0XCe1v3PXrkyMxL4ZOG7cJUFaGEP35U8C/jxqYa8q+A9lUv4jiHR+p0YjjfTuv6WYfBLYVBgos2iXdFr8gTrtWynZbx9TrpZNH9+hJ7MUO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pu0AFRfA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pu0AFRfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735843118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OD5aQ3XEGYN1xZMewWq+sHuf8pkwQMdrxxCJiuCySGI=;
	b=Pu0AFRfAW6Jva/hmMh90QKwxLUzd69WnrG7ozjLHplJfPAR6wfuqpk1YkNy1AyB630gZ/J
	/4tdPqs8l6J9F0xT7qrE9/9Twn0Z+vcHIO8hHXgKoJtMsU0RkDad9AZViPac7Dq5r/KGI7
	HDGObIMXpQgDoZWVvlRRFjwfoePkVmA=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312--O4UMiWtP5669PlNZc8thQ-1; Thu, 02 Jan 2025 13:38:37 -0500
X-MC-Unique: -O4UMiWtP5669PlNZc8thQ-1
X-Mimecast-MFC-AGG-ID: -O4UMiWtP5669PlNZc8thQ
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-71e165f53ffso2912755a34.0
        for <regressions@lists.linux.dev>; Thu, 02 Jan 2025 10:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735843116; x=1736447916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OD5aQ3XEGYN1xZMewWq+sHuf8pkwQMdrxxCJiuCySGI=;
        b=b2CapzBWFaYzumEW49/8zJVULsK472bdGjVIHNhxcotTATTuLpiN/38P5JUC7oQigN
         8YRj6oRzsnZrIIDx6H4VNrbWFk5AUCDMaaimym5HExmXEw4RkPimipnoPDpjLl++RQxo
         z1KXPqCi/oDx0Kqu4wGaNpE/YRu0XHt/uEzrWXFsK5MYQHdQPn9LFeS/o+BN7YEbeB/G
         JYuoS9t09KT/WQJg5eyx6Mnn1hf+ngUfy+ejhbmEgPB2kFoo0ipMhoVb9x9NcQaYq05w
         bBVTlSq+sXKZrjHbvkB59EJwXodaoTJccU1Zp6Zm8To5tgWuWByCJfcEVNnxYOhbyPyL
         52gg==
X-Forwarded-Encrypted: i=1; AJvYcCWbrsU48fMFs5ZQvbSJLfCyIkJOI1uMowQmXhXDNY/Ycjca+M001fsLO5YQnEE+7zGr41m5YIFODsCPBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxavTwZFsyFrZGKrUX/0//8kogz7gDzzIlwebZguEEjjSUrlCqP
	hQlktT8hZXhFrGXfyvASn6t9nTwqoL5i+pH7NLxBH4jrJaEGskLYJokx4QFGW34RysYkdKtRN82
	TIXeRTi7vQ7ZKz/JysMlEhQHIidFGT1yW731hPsFKTZdpZsiwGpvkzQn1MZ70
X-Gm-Gg: ASbGnctbKYw1hNJYZKyEOmvACh2/3A7c22eLriXPYyIgnNohlcjhIbdG400A71YRvR3
	+UunnJpfZVEvJnPLkewiFM0/BUs7fT4FT6sNmQ3sN7cAj3JpGoAFqrcxNtumvz3hd8AsaTr9Ysw
	N4ruG6LTktKqI6ENIw2fwo/AXmZElSxrdeF+wWeuWMtmZdO/vEGqjFWOsRsGH0Lq8hpzOEwLNwZ
	8MSyTyYvb13uzSFjOv4gJS2qXWP12dKPDFqYd7FdDVIF9FKUNSGUoOTdRQA
X-Received: by 2002:a4a:cb02:0:b0:5f2:b6ac:280d with SMTP id 006d021491bc7-5f62e643b13mr7039410eaf.0.1735843116542;
        Thu, 02 Jan 2025 10:38:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVDaXie8HBCSJH+P8ZzXC79A6opQUQfeLWQ3fdt9DAlI2AjF12plGBMJM6bxgHF/9XerH7zA==
X-Received: by 2002:a4a:cb02:0:b0:5f2:b6ac:280d with SMTP id 006d021491bc7-5f62e643b13mr7039403eaf.0.1735843116205;
        Thu, 02 Jan 2025 10:38:36 -0800 (PST)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f4db60d746sm7317340eaf.22.2025.01.02.10.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:38:35 -0800 (PST)
Date: Thu, 2 Jan 2025 11:38:32 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Precific <precification@posteo.de>, Athul Krishna
 <athul.krishna.kr@protonmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Linux PCI
 <linux-pci@vger.kernel.org>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Subject: Re: [bugzilla-daemon@kernel.org: [Bug 219619] New: vfio-pci: screen
 graphics artifacts after 6.12 kernel upgrade]
Message-ID: <20250102113832.4d5c101a.alex.williamson@redhat.com>
In-Reply-To: <20250102100402.33fa8435.alex.williamson@redhat.com>
References: <20241222223604.GA3735586@bhelgaas>
	<Hb6kvXlGizYbogNWGJcvhY3LsKeRwROtpRluHKsGqRcmZl68J35nP60YdzW1KSoPl5RO_dCxuL5x9mM13jPBbU414DEZE_0rUwDNvzuzyb8=@protonmail.com>
	<Z2mW2k8GfP7S0c5M@x1n>
	<16ea1922-c9ce-4d73-b9b6-8365ca3fcf32@posteo.de>
	<20241230182737.154cd33a.alex.williamson@redhat.com>
	<bba03a61-9504-40d0-9b2c-115b4f70e8ca@posteo.de>
	<20241231090733.5cc5504a.alex.williamson@redhat.com>
	<Z3bBOxFaCyizcxmx@x1n>
	<20250102100402.33fa8435.alex.williamson@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hOE2yB93gJFo5Z2cnaWWz_SKdRQ7UeIpxxZZAfdmwN4_1735843116
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 2 Jan 2025 10:04:02 -0700
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Thu, 2 Jan 2025 11:39:23 -0500
> Peter Xu <peterx@redhat.com> wrote:
> > OTOH, a pure question here is whether we should check pfn+pgoff instead of
> > pgoff alone.  I have no idea how firmware would allocate BAR resources,
> > especially on start address alignments.  I assume that needs to be somehow
> > relevant to the max size of the bar, probably the start address should
> > always be aligned to that max bar size?  If so, there should have no
> > functional difference checking either pfn+pgoff or pgoff.  It could be a
> > matter of readability in that case, saying that the limitation is about pfn
> > (of pgtable) rather than directly relevant to the offset of the bar.  
> 
> Yes, I'm working on the proper patch now that we have a root cause and
> I'm changing this to test alignment of pfn+pgoff.  The PCI BARs
> themselves are required to have natural alignment, but the vma mapping
> the BAR could be at an offset from the base of the BAR, which is
> accounted for in our local vma_to_pfn() function.  So I agree that
> pfn+pgoff is the more complete fix, which I'll post soon, and hope that
> Precific can re-verify the fix.  Thanks,

The proposed fix is now posted here:

https://lore.kernel.org/all/20250102183416.1841878-1-alex.williamson@redhat.com

Please reply there with Tested-by and Reviewed-by as available.  Thanks,

Alex

