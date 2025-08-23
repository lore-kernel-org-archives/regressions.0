Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB8123B627
	for <regressions@lists.linux.dev>; Sat, 23 Aug 2025 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755938608; cv=none; b=mDSnmI+wD217bgK148FfOkBPp3oPELCJkwS/XgD2Cm2TphSCDnNR44ea0dCCfEolpHuflpBZFHBaPQk+g3ZQR9bNDVMDjGRV6Xw3+3Op/5mZFIlgdRcW5oyFmdjTOdaQp9KVRJ+tiGZ+vXBQUJUXefhhFZgPzEgbFsurWNYDmFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755938608; c=relaxed/simple;
	bh=Sh7NYksVOg0+cEwI/9mvebfdXkAMbtmN9W/uuKG/FSA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uhG1KUcwEaXhhHtYh9HN9m331e7kmtYHRJxdPJpbHaevDYkqsg4IunxsdxVzFWG3QsYADIxEGFNrvyTmTAuuTtDT2zlBBXdCKAOSDrsQ/Iz73EwHvqOELf7N9oz5MwlqnVwLvQLHqmvCulZj5ZX00tkIshJC1QiFfI5XyHxM5tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rqjg1Kiv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rqjg1Kiv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755938603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBBXwHuqYsE3hHAIcEi+8debmVMKYcuEtsvPds49qLE=;
	b=Rqjg1KivAPkdm/iWXUkGw+V+JGoqbItMcUXJfIBAvM/lyJ0b69QNH7uIp+l+xzkIxhcrPU
	Bvczagu7PDjugUjewBqx1GtM+zSyQZn85uUH60y0CeIdE+zpdsm7o0csiv0t9yIefkLzs/
	lcwr9hnq/gowUbk5clBHPctbuq4muPU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-W35c_ShONqGJzQW2Ulmhtw-1; Sat, 23 Aug 2025 04:43:19 -0400
X-MC-Unique: W35c_ShONqGJzQW2Ulmhtw-1
X-Mimecast-MFC-AGG-ID: W35c_ShONqGJzQW2Ulmhtw_1755938598
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45a1b0511b3so16921295e9.1
        for <regressions@lists.linux.dev>; Sat, 23 Aug 2025 01:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755938598; x=1756543398;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XBBXwHuqYsE3hHAIcEi+8debmVMKYcuEtsvPds49qLE=;
        b=VXFwRjXgT308vuErm6nwu623fUX/DFsbnMilMKHv78/7xcfl3p+rRofCuBEmRxX+/a
         7ZwIqf83jal8MaCqOlhr1VY92APovLh7+tAO2GWS4Qo4xbxgrjP6Y0z7vGK+0wUrHCs0
         jSQuv8SiXByGqJuhUeA4f53csSiaxcsb41dfSxtefjboyZ8iRcWWCyh1r7Vpi8Ow4QfH
         e5pOcNAQQmfRm0xvq7oMKkkWP62lP7m2taz+Q1C6MwUAKttQilraEo6KS7HkeOwsFqnp
         t7zowsvvKZJY5x5bGjNXm58ZtP+BY9dozZuBtHKANA7MxXAY91HOIbgD7YqmwoUH/DTj
         MzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzBzRJw4gXEmMQ6t9R/A328poozzWdOtuKxw9PakPXg+2gGaBlHJXlIgP+BEeKwgKkqipCx2sayCKwKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeDJLEvxbAUKW4KNz1fXv4SzM8YBDJv/xSbKvOaTd8jI6krk8o
	07XhDbBUQEX1AYo4e/W27CKCZB7TSAUm31ncwgTjlajHc/9yZ8PK05V8sorgMYuA3hfNWvqejgh
	cKTUvHUv944Herl1uTr4mNSM8MiPbN1jRwnbYstmX2+uHYU3F54Oql9hqOA38xZuj
X-Gm-Gg: ASbGncuGjg4mcXpugGa9sW+PurSq2sY/2aGYPGvdABKPRUhebcQ47ZvmxOKhk5QU+ZB
	e9EC8w7APAYVBpT+Sjcd2y+Ls8nwV1FH8mD7gIK6unHbpPzX699lCIjCAnUgIPqaGyLda/lZgqz
	XTSilqOrLSu1wmczfQcoBfLHKpZDFbruXZliGLo9ShSEJ1tT41EIQXSZ6u3Y7YuJzfxAV2inlLw
	zzJLxYE3JdPUbTM2vqVyn0iE9p4EhcBeowBOCzwVj7msJ0XXZJ/SJ9VzU09fOo887JHZ2JQNmZU
	9mM4WKa3D+VEWp4q3qDX4PXJu+M3SYoR7oYUUgjC3Usv2lMIVzE=
X-Received: by 2002:a05:600c:1d20:b0:459:dc99:51bf with SMTP id 5b1f17b1804b1-45b56382171mr35465835e9.25.1755938598067;
        Sat, 23 Aug 2025 01:43:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv+xyL1SrPU7/mPMky3/ADZJvuSN9B2wqb3s8vqHaurmc9XXiMDXRKUUTdrtSIewx9stHI2Q==
X-Received: by 2002:a05:600c:1d20:b0:459:dc99:51bf with SMTP id 5b1f17b1804b1-45b56382171mr35465645e9.25.1755938597690;
        Sat, 23 Aug 2025 01:43:17 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [2a10:fc81:a806:d6a9::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b57499143sm27193895e9.26.2025.08.23.01.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 01:43:17 -0700 (PDT)
Date: Sat, 23 Aug 2025 10:43:15 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: wangzijie <wangzijie1@honor.com>
Cc: <akpm@linux-foundation.org>, <brauner@kernel.org>,
 <viro@zeniv.linux.org.uk>, <adobriyan@gmail.com>,
 <rick.p.edgecombe@intel.com>, <ast@kernel.org>, <k.shutemov@gmail.com>,
 <jirislaby@kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <polynomial-c@gmx.de>, <gregkh@linuxfoundation.org>,
 <stable@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH v3] proc: fix missing pde_set_flags() for net proc files
Message-ID: <20250823104315.26060eba@elisabeth>
In-Reply-To: <20250821105806.1453833-1-wangzijie1@honor.com>
References: <20250821105806.1453833-1-wangzijie1@honor.com>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ngA1dPPaxa6VAL1xpBSdaaWm7Ye4kDWWiFo1YanaJkk_1755938598
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 Aug 2025 18:58:06 +0800
wangzijie <wangzijie1@honor.com> wrote:

> To avoid potential UAF issues during module removal races, we use pde_set_flags()
> to save proc_ops flags in PDE itself before proc_register(), and then use
> pde_has_proc_*() helpers instead of directly dereferencing pde->proc_ops->*.
> 
> However, the pde_set_flags() call was missing when creating net related proc files.
> This omission caused incorrect behavior which FMODE_LSEEK was being cleared
> inappropriately in proc_reg_open() for net proc files. Lars reported it in this link[1].
> 
> Fix this by ensuring pde_set_flags() is called when register proc entry, and add
> NULL check for proc_ops in pde_set_flags().
> 
> [1]: https://lore.kernel.org/all/20250815195616.64497967@chagall.paradoxon.rec/
> 
> Fixes: ff7ec8dc1b64 ("proc: use the same treatment to check proc_lseek as ones for proc_read_iter et.al")
> Cc: stable@vger.kernel.org
> Reported-by: Lars Wendler <polynomial-c@gmx.de>
> Signed-off-by: wangzijie <wangzijie1@honor.com>

Tested-by: Stefano Brivio <sbrivio@redhat.com>

For the records, see also my report and obsolete patch at:

  https://lore.kernel.org/linux-fsdevel/20250822172335.3187858-1-sbrivio@redhat.com/

-- 
Stefano

