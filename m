Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F38151016
	for <regressions@lists.linux.dev>; Mon, 19 Feb 2024 19:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708372469; cv=none; b=iQY7wumTle/romJ0UWDxIOylrBrnFbu6oclI/q+zyVyqPidNLzIYQY5jEU0TKwKvMkqdDz/19GQQBXy38FyabJtc7h1FIlhDpO6BCIsL5sMi0U75OTRJwSjvt1h3bxVBDjC3+SyD6hXKuKq3nRlwA+CvFrKlVOV7ydh5MiCSvpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708372469; c=relaxed/simple;
	bh=ahdS3Zn+QIu0uhv09EiJ8/j1ihnNP5swBR9x0i0/BHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fa+mExaJt3VEbBwxO9VGDRr4AyLPHaWr8exYEAkHLBXZyZaQVuEDlG0i9EBb0/QTYE0yw76jtKLKV512Vu3HQIHIlFF/Ex9vxi9oltp2O2jZLNavkPpe3utmgO+8Bw8HERf3K4aNyE0AdI8YIBBnLRHT95KRaMraxkw503VoYCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNX9LvPH; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNX9LvPH"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56454c695e6so2449675a12.0
        for <regressions@lists.linux.dev>; Mon, 19 Feb 2024 11:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708372466; x=1708977266; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPYlqKudaClcKbNFamdeE7+QrC6+8XojTMUekGJ9pw4=;
        b=kNX9LvPHYtFMx5JBbZ3li68QEAd4ncMXT6UgpsKbWNqmE0+IV4+Mm238CPRNm2CrbB
         MfvmCFLp7TCSBkOx4tIVVnERhgqVgF4lOzWMD7SxI+zmlbqI4Jtp1NBiL/Jue5FunVF2
         q1FqP/oD0u7m3oTOfrx2wYhKnknEIBjcViWNrR+r0xpM8abQeTx6sQlbv0EN6oVsUNgU
         Ku5P6pgaq4uqipqg73FcVv5oB+lggEb0pXIWvRVrmrs/AKc36FqnNoh83UrE+sbaSWS/
         zfTdUHj6qj63SkMHTNHKd26+2MufvyD76Ft6Db+T+uxJstPg/RMjePNK8K9O4eFKd5yr
         OtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708372466; x=1708977266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPYlqKudaClcKbNFamdeE7+QrC6+8XojTMUekGJ9pw4=;
        b=ZYhpxwkQrdUE3fSpS/G9CvNiY0MPLCzCbHcG46d+w7juDDhv96N5LNaBiEAaHyJil4
         wYIiRjC426LAXlgfUcfqdqgZ411x6/v50ZG9Hoj/+un9+d2U2LFkrJXZGubnHnA6NGh/
         BOn7YHHVEtXcwL5lYFbp2WWmuiM4mbozdskiys1Kbaj/XSldAZzB/ynqzu3R41QCiknf
         HE5dh5pEoXVfr7PdpcQQU7l/GpZbCJXacgiagnItADnjtvRIJjOjy2RWtFov91H6uO4u
         dqQtGicfibdFXuM3xT1IggB1CEdZdVW3SaulqTlBLD/RzzcVuqaKGD+jjQl7fyzXHwz+
         oy0w==
X-Forwarded-Encrypted: i=1; AJvYcCVCvzMEpmQp7yf1VRsZiz+j/aP1wD+DIRraCdMaaZr3Rwty5AbPtkQ0p+P3Hc7UUD34FGje6x1DCXHaQPn4adzFY8VNRepq74/rqwQ=
X-Gm-Message-State: AOJu0Yyv1+69ltSn8cb1OiIEb9PstPJ6i/rY7CHAjmYAxArvgzrlT34z
	iNIFawqQDLkrtvah6s81sPfqSSP3Y/sz/K6nQoMF2ye/n2RY9t0n
X-Google-Smtp-Source: AGHT+IGy17EHv3w5kRGCvBk4IxezGA5nNXlG3sjHaPpclSP5gUQDDuET4mul61ghYdEBQQf2Q15JQQ==
X-Received: by 2002:a05:6402:5207:b0:564:4211:faa3 with SMTP id s7-20020a056402520700b005644211faa3mr5547391edd.1.1708372465382;
        Mon, 19 Feb 2024 11:54:25 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id fi17-20020a056402551100b005612025465asm2964948edb.74.2024.02.19.11.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 11:54:24 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id EF00EBE2EE8; Mon, 19 Feb 2024 20:54:23 +0100 (CET)
Date: Mon, 19 Feb 2024 20:54:23 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Chao Yu <chao@kernel.org>
Cc: Dhya <dhya@picorealm.net>, 1063422@bugs.debian.org,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [regression 6.1.y] f2fs: invalid zstd compress level: 6
Message-ID: <ZdOx73kckFXADcol@eldamar.lan>
References: <170736382774.1975.1861975122613668970.reportbug@tsuga.picorealm.net>
 <ZcU3VCrt9VOpuFUq@eldamar.lan>
 <6d14ea70-ac1c-46f2-af1d-ba34ea0165aa@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d14ea70-ac1c-46f2-af1d-ba34ea0165aa@kernel.org>

Hi,

On Mon, Feb 19, 2024 at 10:35:13AM +0800, Chao Yu wrote:
> On 2024/2/9 4:19, Salvatore Bonaccorso wrote:
> > Hi Jaegeuk Kim, Chao Yu,
> > 
> > In Debian the following regression was reported after a Dhya updated
> > to 6.1.76:
> > 
> > On Wed, Feb 07, 2024 at 10:43:47PM -0500, Dhya wrote:
> > > Package: src:linux
> > > Version: 6.1.76-1
> > > Severity: critical
> > > Justification: breaks the whole system
> > > 
> > > Dear Maintainer,
> > > 
> > > After upgrade to linux-image-6.1.0-18-amd64 6.1.76-1 F2FS filesystem
> > > fails to mount rw.  Message in the boot journal:
> > > 
> > >    kernel: F2FS-fs (nvme0n1p6): invalid zstd compress level: 6
> > > 
> > > There was recently an f2fs patch to the 6.1 kernel tree which might be
> > > related: https://www.spinics.net/lists/stable-commits/msg329957.html
> > > 
> > > Was able to recover the system by doing:
> > > 
> > > sudo mount -o remount,rw,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,compress_algorithm=lz4,compress_log_size=2,compress_mode=fs,atgc,discard_unit=block,memory=normal /dev/nvme0n1p6 /
> > > 
> > > under the running bad 6.1.0-18-amd64 kernel, then editing
> > > /etc/default/grub:
> > > 
> > >    GRUB_DEFAULT="Advanced options for Debian GNU/Linux>Debian GNU/Linux, with Linux 6.1.0-17-amd64"
> > > 
> > > and running 'update-grub' and rebooting to boot the 6.1.0-17-amd64
> > > kernel.
> > 
> > The issue is easily reproducible by:
> > 
> > # dd if=/dev/zero of=test.img count=100 bs=1M
> > # mkfs.f2fs -f -O compression,extra_attr ./test.img
> > # mount -t f2fs -o compress_algorithm=zstd:6,compress_chksum,atgc,gc_merge,lazytime ./test.img /mnt
> > 
> > resulting in
> > 
> > [   60.789982] F2FS-fs (loop0): invalid zstd compress level: 6
> 
> Hi Salvatore,
> 
> Can you please try below fixes:
> 
> [PATCH 6.1] f2fs: add helper to check compression level
> https://lore.kernel.org/linux-f2fs-devel/20240212160530.1017205-1-chao@kernel.org

Confirmed that this fixes the reported issue as it was reported to us
in Debian in https://bugs.debian.org/1063422 . Thanks a lot!
(note just tested with the first commit as it landed in 6.1.78 to
confirm the immediate regression).

#regzbot fixed-by: cf3d57ad6ff8b566deba3544b9ad3384781fb604

Regards,
Salvatore
