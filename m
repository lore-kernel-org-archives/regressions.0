Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B1F3C46B
	for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 17:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710176684; cv=none; b=KPvn6Luw6OgOs3ZBib+IUZpLKaIERGjGZatmLzgjvd5Nh4JqxVIoAA31f3j8JmcqevSF+fPA5GoeKNHBUc7LXkk/523gTWb3zj0anFK0Ey/OyEtZMlfKaLxwQd80r0reRU2NosQ2ElwGB3xhbPZThpnkHp0JAU7qvksKVc3/Uug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710176684; c=relaxed/simple;
	bh=nEwjlsDuh1BBJpQl7CFyLetW/Pf4Lp62bRB2Jd2W7Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJA5gqIhY2UNsu2RmMxRCcIqAXy5InFrBNRYBqsID5UN0ewI++Ku/hDJWVhGJQ9Nb8PW1UL/z800NmLHttZDArhgQWoIweMcnUFIIjWq7rGacRxIljK3FaRmdIzQzca3FpsRBnQz1iY1EAsGzjhd7qy/pORsKOmjVJYS+SkCc14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQGGFGbg; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQGGFGbg"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3664e9d66b9so8103205ab.2
        for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 10:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710176681; x=1710781481; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLvEvFfc7sXj9N7DoQT3M6dC8xShppj/zokxxJquUjk=;
        b=JQGGFGbgj4TsPStsgGOMGlW5OYZtEZh9uQArQ8tK2s7FucUMItKqj5WQetuONsst7B
         uQsaMrqYI3YJL6Sc+6uaX/xjvzKa0QHuenJupJXIcHRaoT6su/jGeCML47QVScn8fdpI
         wpHQHANvzPyFiM3dIMYuMI0E2Bc+nPHqv7UP9iHRZtFNJpvQroFwo3Y9vjfPc21Xg5Oy
         g0UtZJIGxCoTXSPQUoCdL7/HR/DRX83KlkQIubGg33kftuh+RwFiAZoZfd2hKsPQDDkP
         dyy3LJTSMWgUH3sr5lSwaPzPznrKpil/q/T3aTK7JtTKQntM0BHPt0CDF64WFJKT8FDW
         Pq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710176681; x=1710781481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLvEvFfc7sXj9N7DoQT3M6dC8xShppj/zokxxJquUjk=;
        b=FuKukwS/gikjpcvMTyBfyncrHFfW0NjnT1y95kxII01EtANaLSRp2c9IoC9ang0cQS
         mQG+Y4sWsO5blMXa72THR3/jkuRib/PSmgvdEiMryzCOpZTQ0nkcVZy9J3+t4GN/Wk9P
         zhs7makEowooHRSeXnlS1rAvcHD+FvFcIKV+eb33vbDmc2CZhn46OOzXc7atuQzzlyMJ
         ziJ/KeJc05ds4tDEGdUzGdrBRtNpOXLLRi7WhqNPGPFN/kPS7ZtQx8b318cHEBtnWc5s
         jcACmqp5TWn02/yBYXiW6vkd2YRzTnx9g+MFZb7jZd5j07lU34bRbEJ9PI91W3Ufhk8T
         QqpA==
X-Forwarded-Encrypted: i=1; AJvYcCU+EnLEdzUs1n82Z0wkECNf4xGT+WvCKbJ9lpJ0l/migecv4c8e1Drm2gaY5LcU+lvVsL2mV9E7Zlt6NN+5C4luw4tpAzX0E1BzvMw=
X-Gm-Message-State: AOJu0YyTcOZ81D+aXlh2lUvGJSfzTa+z5n2/t5P2XP95Fp432SUIbwLl
	qRS0EJqm+RZVT4Vt0H5mDDYBsRv4unDquID/FJ4pBYu60lChr1to
X-Google-Smtp-Source: AGHT+IEgAZfjT7LfIQHhxciQab3kA+AMIbmZFE5+4xwrYc+EzjZ26fQCy34O0B5bZyGjrTyX9jYR7Q==
X-Received: by 2002:a05:6e02:1a2e:b0:365:27e7:4b60 with SMTP id g14-20020a056e021a2e00b0036527e74b60mr11077796ile.21.1710176681285;
        Mon, 11 Mar 2024 10:04:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t17-20020a63f351000000b005dc4829d0e1sm4700602pgj.85.2024.03.11.10.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 10:04:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Mar 2024 10:04:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Problems with csum_partial with misaligned buffers on sh4
 platform
Message-ID: <351dfebd-c09f-470e-8b03-cc904753b136@roeck-us.net>
References: <65ed7c95-712c-410b-84f3-58496b0c9649@roeck-us.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65ed7c95-712c-410b-84f3-58496b0c9649@roeck-us.net>

On Sat, Feb 10, 2024 at 07:12:39AM -0800, Guenter Roeck wrote:
> Hi,
> 
> when running checksum unit tests on sh4 qemu emulations, I get the following
> errors.
> 

Adding to regression tracker.

#regzbot ^introduced cadc4e1a2b4d2
#regzbot title Problems with csum_partial with misaligned buffers on sh4 platform
#regzbot ignore-activity

>     KTAP version 1
>     # Subtest: checksum
>     # module: checksum_kunit
>     1..5
>     # test_csum_fixed_random_inputs: ASSERTION FAILED at lib/checksum_kunit.c:500
>     Expected ( u64)result == ( u64)expec, but
>         ( u64)result == 53378 (0xd082)
>         ( u64)expec == 33488 (0x82d0)
>     not ok 1 test_csum_fixed_random_inputs
>     # test_csum_all_carry_inputs: ASSERTION FAILED at lib/checksum_kunit.c:525
>     Expected ( u64)result == ( u64)expec, but
>         ( u64)result == 65281 (0xff01)
>         ( u64)expec == 65280 (0xff00)
>     not ok 2 test_csum_all_carry_inputs
>     # test_csum_no_carry_inputs: ASSERTION FAILED at lib/checksum_kunit.c:573
>     Expected ( u64)result == ( u64)expec, but
>         ( u64)result == 65535 (0xffff)
>         ( u64)expec == 65534 (0xfffe)
>     not ok 3 test_csum_no_carry_inputs
>     ok 4 test_ip_fast_csum
>     ok 5 test_csum_ipv6_magic
> # checksum: pass:2 fail:3 skip:0 total:5
> 
> The above is with from a little endian system. On a big endian system,
> the test result is as follows.
> 
>     KTAP version 1
>     # Subtest: checksum
>     # module: checksum_kunit
>     1..5
>     # test_csum_fixed_random_inputs: ASSERTION FAILED at lib/checksum_kunit.c:500
>     Expected ( u64)result == ( u64)expec, but
>         ( u64)result == 33488 (0x82d0)
>         ( u64)expec == 53378 (0xd082)
>     not ok 1 test_csum_fixed_random_inputs
>     # test_csum_all_carry_inputs: ASSERTION FAILED at lib/checksum_kunit.c:525
>     Expected ( u64)result == ( u64)expec, but
>         ( u64)result == 65281 (0xff01)
>         ( u64)expec == 255 (0xff)
>     not ok 2 test_csum_all_carry_inputs
>     # test_csum_no_carry_inputs: ASSERTION FAILED at lib/checksum_kunit.c:565
>     Expected ( u64)result == ( u64)expec, but
>         ( u64)result == 1020 (0x3fc)
>         ( u64)expec == 0 (0x0)
>     not ok 3 test_csum_no_carry_inputs
>     # test_ip_fast_csum: ASSERTION FAILED at lib/checksum_kunit.c:589
>     Expected ( u64)expected == ( u64)csum_result, but
>         ( u64)expected == 55939 (0xda83)
>         ( u64)csum_result == 33754 (0x83da)
>     not ok 4 test_ip_fast_csum
>     # test_csum_ipv6_magic: ASSERTION FAILED at lib/checksum_kunit.c:617
>     Expected ( u64)expected_csum_ipv6_magic[i] == ( u64)csum_ipv6_magic(saddr, daddr, len, proto, csum), but
>         ( u64)expected_csum_ipv6_magic[i] == 6356 (0x18d4)
>         ( u64)csum_ipv6_magic(saddr, daddr, len, proto, csum) == 43586 (0xaa42)
>     not ok 5 test_csum_ipv6_magic
> # checksum: pass:0 fail:5 skip:0 total:5
> 
> Note that test_ip_fast_csum and test_csum_ipv6_magic fail on all big endian
> systems due to a bug in the test code, unrelated to this problem.
> 
> Analysis shows that the errors are seen only if the buffer is misaligned.
> Looking into arch/sh/lib/checksum.S, I found commit cadc4e1a2b4d2 ("sh:
> Handle calling csum_partial with misaligned data") which seemed to be
> related. Reverting that commit fixes the problem.
> This suggests that something may be wrong with that commit. Alternatively,
> of course, it may be possible that something is wrong with the qemu
> emulation, but that seems unlikely.
> 
> Thanks,
> Guenter
