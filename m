Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90A0537E9
	for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 08:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539455; cv=none; b=Q9VkKpItcwdOfCTIkWvNC6WvhpyEsdJLkXKBXISRu28s4V5M89LOo+JoMMzzQPCdqhecnPeOsBuGZLmMERgMz6vmHgnKeZczwqPG+lme1+qa+iiHrx0A0EtbAYPkHTP7xkYvxYrI4DQKsIbjh1W6JhpYCyUK2aeVVRkfC/7OSiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539455; c=relaxed/simple;
	bh=wcX5j6kBHArhq5tdbc3vVtnEDZVFnM5hLsVJLi6v03E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YPSesJUIGu7+f+65A/g7AGQ9PLbC9y9y+3QGrhfhbuEQjbq8Zo60Bl1z+r6R7XBi18YSqoGPoMv5xf1mRxFnmYiAuxRgGZ1aZd4bNcF/Qu1y8fB8anoDsnnfj9gLM6CD6NtxbnGjm1dMO4yQ9Vyyoe+Jggf9LZ10oeIARntqybo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=l9j8Y3Iw; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="l9j8Y3Iw"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8804ca2a730so85425046d6.2
        for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 00:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1763539452; x=1764144252; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wsu/QpI7t5MSf2fTjgE3xkQwSlroPkgW3wKRe9KD0qA=;
        b=l9j8Y3Iw3oWOE+ELoMfOZQgeCQqTnEbGQbmD/3aQnUe9iE3t7vu/y6MP3+Xce61QO2
         cOCl95Up8X8G+bK1Y7b2znStsd/8Txy6kdkgM3vNQ7ZLH75mckP1NYtIhbSbASmIMLr/
         +fABPkDD15iyog+PRHXCeh+vjvDaCf8Gd11mpiWroCAxdqCqCe+oa+DtTQVdKSKBYnxh
         hya2MV3bwQpLS7WuRb1BQmCRU1ni6RbECvGRvXC/QLaGsDyGu8e8/HuRWNnQFG8p1wls
         b+sKOVNVa9lbQ0O+GJWwc4Aa54fj0TLH6LUP+X4HIdO04zdxdJ8UAKjgAtELFUiXNTaK
         OCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539452; x=1764144252;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wsu/QpI7t5MSf2fTjgE3xkQwSlroPkgW3wKRe9KD0qA=;
        b=njkZxkjtDstAKvdDAzO0Fp8iFSbB37/OrcYiV1LtGugnxGkuBa299+pMIWaoZp/D8V
         664tYir8W6JqMvey1USE74LZ8y0oasRgyIBOaxmx4sRSkF0UujmCcWCyCxT9wJCQKJAD
         xNAsu2wtv0kVY22PFjmZkecBwXZx2HpbDPJtHijmeesKlYt2aDBsgObA2FyH6T62dfbm
         OE9Wc9lkt3KGvjrPc88oT+7zFRwSsuPPPCWGGK18UHvy2aN/Mt8jCd09WSmnX3sZC85m
         2sMWZk6YmplDiI1nVhK6hhr3to07BUQ7M4GfNR2QxfRrwBWBwweWVLwkdE5QuHvR4BYe
         rM4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXN3YlpYr7yzSvzWv/I7Qz99/TPD1SpDdKOSk9wuIPnFG1D6kzJOASrEb2mL5Lr05R+fcTjOfTGx41BCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxrqn61DuQhri3exdQmGt9wCAxPzjoRql4b9bZe71vTXHoN/DPS
	XZoK9+XCsMFTiMuctERRjbvuoZTat0W0/mXwfz5kcTVr/+TjZ9QP6WYEC+TTe3qu/oE=
X-Gm-Gg: ASbGncuqegZGfDd6GH5xIW38fJeseSZoQyGcIYyBnZtExOEreQe1GZ+505iGUc/FVtN
	deOw7Przj+6onv6J27u0/Uftm6ayORTzLdrmrkzoiDwWsvdGsPQjHtRDdVhcE/g/4wLH7/SkbfP
	nt55jPHGQD/UmrYR/FflWWkCEUaOCdwH3jNwa0eRpqRYTeiRw1Hw/s66KR9CYPeEC+oJF/5FX4Z
	hf/I2tuuaOYWhlRcokQCeraJs0Z72nmb+vlNG0Gd7ndkf75VpzyczOk5mrIP/bmlzv/QYx6znC1
	togvnARoML0U044AOR76w5z9TnGWO905XDaRAaSRyTQwkioX9Q+bBEX/OG50Iyu+UiqzLSvy1P5
	102tAz1YskT4p/rf0ijcFgHXvS3SDgOd4g7b5WF8jZAXMNHIOtbpU2b2onMBRzYOo0KkM6v0J0F
	iTp49uvByhzbFPkFJEtyyqWwHJzZyFpk6M5k6uBPkFXavF5rrz8tE=
X-Google-Smtp-Source: AGHT+IEiMyhzd+qGjTtcxcTjOLP0R9Qanx9dNGOYwrZcvV4wYdUzZw16azjZu+qw8eNfk3RnSRhkBw==
X-Received: by 2002:a05:622a:389:b0:4ee:1c10:72a3 with SMTP id d75a77b69052e-4ee1c10770emr152767231cf.45.1763539452563;
        Wed, 19 Nov 2025 00:04:12 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4ede8593c6asm123256411cf.0.2025.11.19.00.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:04:12 -0800 (PST)
Date: Wed, 19 Nov 2025 03:04:11 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: linux-block@vger.kernel.org, sparclinux@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>, regressions@lists.linux.dev
Subject: PROBLEM: errors mounting /dev/fd0 on sparc64 (regression)
Message-ID: <u3aaz4bx7xwlboyppeg4y3eixzgxbcodlmw7cwqloskmg6oqw2@j437p47sfww6>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

With current kernels on my sparc64 system, I can no longer mount floppy
disks via /dev/fd0.  Mounting the specific-format device /dev/fd0u1440
works ok, and if I do that once then /dev/fd0 works afterwards.

  # mount -t vfat /dev/fd0 /mnt
  mount: mounting /dev/fd0 on /mnt failed: No such device or address

  # dmesg
  [...]
  mount: attempt to access beyond end of device
  fd0: rw=0, sector=0, nr_sectors = 16 limit=8
  floppy: error 10 while reading block 0
  /dev/fd0: Can't open blockdev

  # mount -t vfat /dev/fd0u1440 /mnt
  [works]

  # umount /mnt
  # mount -t vfat /dev/fd0 /mnt
  [works]

I bisected the failure to this old commit:

  commit 74d46992e0d9dee7f1f376de0d56d31614c8a17a
  Author: Christoph Hellwig <hch@lst.de>
  Date:   Wed Aug 23 19:10:32 2017 +0200
  
      block: replace bi_bdev with a gendisk pointer and partitions index

And digging in a bit further, prior to this commit the maxsector value
in bio_check_eod (which prints this error) was calculated as 0, which
would seem to effectively disable the check, but now it is 8.  This 8
is coming from the set_capacity call in floppy_open, which in turn
comes from the entry in the floppy_sizes table which is initially
set to MAX_DISK_SIZE*2 (a constant 8).

Using the latest 6.18-rc6, if I change the definition of MAX_DISK_SIZE
in floppy.c from 4 to 8, then mounting /dev/fd0 works again, but I'm
unsure if this is a proper fix.

Please let me know if you need any more info.

Thanks,
  Nick
