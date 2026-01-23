Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6DA2BCF7F
	for <regressions@lists.linux.dev>; Fri, 23 Jan 2026 20:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769198959; cv=none; b=oWqfOmLKPLRinS5duP2wysSNi0GyxiYjLAQSP31bD9ZPk2rWxvaNXwD0KPJz/82qMm2GdxCCzVF2d8tDCOS1rzRtQ6flL6ucwSO44PgK5kV6ZKowxsfcwAG7X+GASoPtt0085E8N96FgG+6xB59Ruf69mrCkp/Zkegm1EOxqvoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769198959; c=relaxed/simple;
	bh=nF2v79I4kSFPgvDDjb73ZJpLFS0MsNdvnQNwO3Q7zys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=MtgOYu4jYU2pRS+XdFWr8D7gHdFDPww/hjxbfe17x/GUEj1yMp4gTv8X7TWcNG4LlYNi/5Aa7qdCTLk1lMR/EyV0Yh2oIuFqqImMWJeN0gE7u/NZmgjC0oyfuWkpNmPcYw0QQCsqzTA8fTbcljzsvJH6Ae6THv+pFN3pEqNx0vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hqZ3Lkcu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hqZ3Lkcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769198957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SlstkNyEnMu0SOOtlIRL+3pvXue6Qm44dVA5vs4+sDk=;
	b=hqZ3LkcuDl41IcAoEYZ9E323ZboghEu0nO/bmI6yj4ritWEt/Esulozb7VdFA+keHQSWEO
	/VdfpYNabF8t20QW0TBYFMhkWA3NhWopuWg2BbKjYj0JV2AHMbj+iyK8yH6O4+TcMYPjDC
	+voVIqwYZAnkOqxvVmrFT6QVoNaAXhU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-vz4SscAeNFeJD6DNnMeLUw-1; Fri, 23 Jan 2026 15:09:15 -0500
X-MC-Unique: vz4SscAeNFeJD6DNnMeLUw-1
X-Mimecast-MFC-AGG-ID: vz4SscAeNFeJD6DNnMeLUw_1769198955
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89470bda22aso67862696d6.1
        for <regressions@lists.linux.dev>; Fri, 23 Jan 2026 12:09:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769198955; x=1769803755;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SlstkNyEnMu0SOOtlIRL+3pvXue6Qm44dVA5vs4+sDk=;
        b=p/2wJFCZWeOaDfv3G52PShcv71/e3XFurzr4OAAcVjUJ14VmxeZ5uc62EO4UDHd8tn
         P0Cgr9pR9W1Y2zFV6Zi+13VFmxd5UatO2iyjVjZkvl9XW32n1dLhY5rnQmlJMVSiVmnu
         BHdYClbsAG+6g7mpSeKjnvhYnJnaiUB0fwIgcaQ1h3q8HEtk89+VrFHZeT8rVjjHrKi7
         MkyPT12bAISvW1DoMy/zWWMwVSLbnhZnMbDP7FACLeytSqi5lqvPatXr4OGgT95ZlZ5X
         xhXgOcoARMeHVr7EgyBEEc/A/VM2XLzZWIN6aDEnGpRyG5eKwSACHm+VkQxgT5puOaZl
         W0Jg==
X-Forwarded-Encrypted: i=1; AJvYcCX4IQqhjSk5c+10gcSwaMtN7P1ZuYTfvOmeuqI6do+7H0h7oKrTQujZW3+K8uiLwe+2V2/c7smbVbmsYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNY5RjLwNQ7oFh0TLH2RYOropz+RbohHfOgFnVisoMwzNUeqzQ
	nSw48+jnbOHvl0jjxn5pXEdgeq8mwsE+QSs0rroxBm8g3KxWuXqMjcwslFADFSUiUsRMTZSpGn8
	RuCYl2F6EtHxGT4SaR9LxCAa5K9tCOqVfIHgMEARfPM6x/l6FQndclcE+FhRWkiT2
X-Gm-Gg: AZuq6aKbd6oC07vIVBvMiadlhB632hNMMcYRgGVRDOWWWoD4Ps7z0ZblDEisKnzuFCw
	HJbbRh2n50bixvaCWLS3GCC9VSRnFF62dC4rPt7DSdYHoWnb44mN9m7CeNunC35zfCHmJCZWR7p
	jzW/LUZy9/6SIYuvySxn7M6REYLf8TejO57tsyTzBZgy68xpdBGHUxMIGoAtUI9/3jlOnv+jJ//
	bbtAtZCRq45r8i2E5NTZTqK6iCg3FhMDmFuKRZr/TGeJBB/Znd5ygRF4pv6GblCmBR05HYW/cfk
	lzBaRndNVjXc9oD1S/tHlrg2qJiALiT0mZ5yLls6waCHIe7+dNCKmaQ5707BCDYJqhkfAvZjZJA
	WYJWQOGY=
X-Received: by 2002:ad4:5c63:0:b0:892:6efb:95e3 with SMTP id 6a1803df08f44-89497df9196mr33772356d6.3.1769198954898;
        Fri, 23 Jan 2026 12:09:14 -0800 (PST)
X-Received: by 2002:ad4:5c63:0:b0:892:6efb:95e3 with SMTP id 6a1803df08f44-89497df9196mr33771846d6.3.1769198954518;
        Fri, 23 Jan 2026 12:09:14 -0800 (PST)
Received: from thinkpad2024 ([71.217.48.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e3870c48sm244117285a.51.2026.01.23.12.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 12:09:14 -0800 (PST)
Date: Fri, 23 Jan 2026 15:09:12 -0500
From: "John B. Wyatt IV" <jwyatt@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	"John B. Wyatt IV" <sageofredondo@gmail.com>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH] coco/tsm: Remove unused variable tsm_rwsem
Message-ID: <aXPVaDmBgiMxwYht@thinkpad2024>
References: <20260120-coco-tsm_rwsem-v1-1-125059fe2f69@linutronix.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260120-coco-tsm_rwsem-v1-1-125059fe2f69@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W2HYQ_g6kK-XkVwfl0hLl_FyCJOnix31-Zu_4Fzx1qc_1769198955
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jan 20, 2026 at 01:07:11PM +0100, Thomas Weißschuh wrote:
> This variable is and was never used, remove it.

Hello Dan,

What is the status of this fix? Without this my builds are breaking with
CONFIG_WERROR=y set.

As per process/handling-regressions.rst; I am CCing regressions.

-- 
Sincerely,
John Wyatt
Software Engineer, Core Kernel
Red Hat

