Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BF017BB16
	for <regressions@lists.linux.dev>; Thu,  2 Jan 2025 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735846148; cv=none; b=u+xp30/NnlGl4vCXNOQ+KzAu1drmb1CAhUswmzAsKjvwG4VFaZ8Qh0mnhcvWZD7kcZdZ5ga70/0Bn5Ygx7sTe/XORVKQjVjclEuaA8/6LUPvScKcEthlzXEMePUeWqMAo0LEpW8lfQLSnDyj/okS8A2/QSToq7qL96waBXhmaYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735846148; c=relaxed/simple;
	bh=GWdEuXg3WUDZDGjGFdNsNR/oBNnu0D17oPDtWlVfFM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=j2oNAO1WU+U+QZqVIj0BA8w4j2zeOPT629sNg/oE0BPv6x7+Vv8JvFiUer2UGKZpCDj57npChT6Q1H7a0uHJ/2N25bf3pbS59aamkLTPMbRFM9erxAwUP7wgZGJ5n4A8hah8W1jysduGkWrxwE58vm4OQ2hgfXFMFniZnjTU1r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fwHl1Brz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fwHl1Brz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735846145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PqrnXD3+1RR06iBvi9uXmFy/HWAjf6sbg1PXAd5cQdI=;
	b=fwHl1BrzAaAO04umyYju+L7+TCrfOXtJB6RN1q7hhPkANI7ZgQTOVlgMkwxpsB/A1QpxTO
	BmX55VkVjGuGM0PlLkJ4H46Chwm7Qnuk580kcg0lta1mWmd6fgkD/BAKx0q5qlppxaOwZF
	FR6HvZ6ItPARuVCZKEGv4yR/g4BNmnE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-mgP7QnHcMmeHW4UfPoyjAA-1; Thu, 02 Jan 2025 14:29:04 -0500
X-MC-Unique: mgP7QnHcMmeHW4UfPoyjAA-1
X-Mimecast-MFC-AGG-ID: mgP7QnHcMmeHW4UfPoyjAA
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d87d6c09baso167558806d6.3
        for <regressions@lists.linux.dev>; Thu, 02 Jan 2025 11:29:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735846144; x=1736450944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqrnXD3+1RR06iBvi9uXmFy/HWAjf6sbg1PXAd5cQdI=;
        b=cUBF8Opn8ThLziSicJMN/HN8QLs6ear94iNhkJdFIrTNd0MhvKJq1VscpuIIWRldBG
         H691MJICoRK3VG09SvEHQqi15oilmLqFh3qweY4ZQYnaEPCnM2CUGC59zH/ukfFvEzOI
         om5M1J77usfmdyPqaAKgN/7P9AxJ0s+Sn3JiYpPHfZOkMprV+pWQIit/ukioukl7+bi8
         pBEEi4gRvvFLSUDJlnwuQWgUVf1LJC4Df8hE/tWFk+lj60gMct8OxPzmJMTyf+IPUOOf
         UPx3RdrIMHnYkljB1hs80PmxOjTxN32W+8JERtvzqQt2+VvFX74cu5veebMyoozYPUDm
         0ZnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKa13ISMiajo/vT632Ibx6wMqm+c/Y6Jl6KWwdDh6JLmkcZ5KzjNviPRoBVJq84KU/89o+Ew94kHN39w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCYWrnPIyJ9Q/KAQN9ApTH2tx1Kzdz8KRKqdXDVdbQ6/3yCYj3
	ARSXqt+AEm4hOyWAU4d/p2ENnqFlvWfqj00SiWfr3bjKOTgHbRejQpKAjJ4fOT7VOj7oWBCYFjV
	fPTNNLODQ3zvBFi8aWDTJydAmO87jofUvJxNFlwlsVnjZB+QCosDROpUlcT3T
X-Gm-Gg: ASbGncstpQRQ1h3/3aQHGwCwUGvN76bTmNvfwZoS9Jw+1XfYMFMjajr90eO5LfByfhQ
	e6CRFdxojvOOcbxY8+QxZx4NRAmOWAYZafJtJ5aM8XebmIqyFffAW7Ea1M26RkeHNoPFB5946vP
	xS/3ZNQ6QUtt/+k82gwP89VA9JKbrbteyatRJvHuBJxdtxDtPZ546TmQ5Q5A3WNWoI7DAEUKUjA
	K/izUw/XSQsENTo7QXaiw33yVFLymjEU7JzZeedYZejlM0NPhbgJVn3syHqEDgc9XDQgT8fdqM9
	MBqsPzuZ2sE1N2Z07g==
X-Received: by 2002:a05:6214:dca:b0:6d8:aa04:9a5d with SMTP id 6a1803df08f44-6dd2330bad3mr754637386d6.4.1735846144012;
        Thu, 02 Jan 2025 11:29:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpdC/2YXkIAOTi4K3SggAQlhXdABeSiWVvsv/qQ0FgTGnzpIL/OI93lXM53tLkNbD4XLXwkg==
X-Received: by 2002:a05:6214:dca:b0:6d8:aa04:9a5d with SMTP id 6a1803df08f44-6dd2330bad3mr754637166d6.4.1735846143772;
        Thu, 02 Jan 2025 11:29:03 -0800 (PST)
Received: from x1n (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd4194937bsm100205756d6.95.2025.01.02.11.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 11:29:03 -0800 (PST)
Date: Thu, 2 Jan 2025 14:29:01 -0500
From: Peter Xu <peterx@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, precification@posteo.de,
	athul.krishna.kr@protonmail.com, regressions@lists.linux.dev
Subject: Re: [PATCH] vfio/pci: Fallback huge faults for unaligned pfn
Message-ID: <Z3bo_TNnwweOH5cp@x1n>
References: <20250102183416.1841878-1-alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250102183416.1841878-1-alex.williamson@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MJ0DcYnbzoUflZ_NjZtP-CauiS7rt1TRHjZjpZcPiLI_1735846144
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jan 02, 2025 at 11:32:54AM -0700, Alex Williamson wrote:
> The PFN must also be aligned to the fault order to insert a huge
> pfnmap.  Test the alignment and fallback when unaligned.
> 
> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219619
> Reported-by: Athul Krishna <athul.krishna.kr@protonmail.com>
> Reported-by: Precific <precification@posteo.de>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

