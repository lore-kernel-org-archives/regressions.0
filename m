Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8FB367F3A
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 08:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056490; cv=none; b=Z1d0TnlPZnMTWhoGXXkhncQKTwnx8TNd023kGW3bWlGeRBrZut2agx62QdBi1WKUHN30l3YbWOJXykaTcTCgCQEnbR8aWejed4zOzKYSdcq3KzDPi93Vm9WMmVw8T2/fnssvqq9DYL5KgMswkFgKTRQg+2x3v2xW611AqUAwCTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056490; c=relaxed/simple;
	bh=I1J9akN2iG0xeezhbdYpo1s4eVlOCZKtP1+ueuzkiZc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TW07EHXGz1du9VdMRgIkbKhybXN2QR7uODVRTe4aWyUjwZZm87CmBSMT6VMMrPYYxW9oWv2xKZme54vXCIiVZhLpcKfEb0yz6eWtiEgDb+aOtzSFu7yf8fSpAeHQ2cZ+KmsNMO39Hym+UFlXMXvyzXL5QkBtxuAo3KG/BS/x174=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4aiOLYT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4aiOLYT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48374014a77so72468495e9.3
        for <regressions@lists.linux.dev>; Wed, 06 May 2026 01:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778056488; x=1778661288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z5ED+Pf9v/Xkb5NAgAq58SEZN/bOoZeXGr3NEMbxVk=;
        b=X4aiOLYT6ur+A0VV64UBb8UPj/3vqr6ICp0M/UohZ/1NLD3Vn7XNELIsJQOgEzeFYz
         83u+1RcZv6ZyTvahVgrP0ff2lU2aEMmlTZ/jKcUlAtCwydxoa6auUq7PttJbu1agkGEc
         6jjE+TM6Bb5ofkB9k9csIyomAhMAtImW6Nb2dSJSYkNuk4xXBmz6UghksHbqsNhYGISy
         Cbq0+zgxgk38wbBHvrbNbLxhyrqnLbBZl129KUxiKB6is6utV8/8yHIfY3Zk24JG7jSX
         4ivwQNJLIPizNDVl0Wu5VRe0Aeq/bhvareV92GUu22qavXm2Q4ROmSrmKF+cKttU69qW
         VgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778056488; x=1778661288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8z5ED+Pf9v/Xkb5NAgAq58SEZN/bOoZeXGr3NEMbxVk=;
        b=QW4AOQys3B4iUXXvALxk7HAf3PE2Oi9JG2yCZIi/dwieVFVm2frLU81+WMkUa5f5tA
         SRUc13jyRkk1TRVabX3qx4to6jcPYw4tjFBibppmzhnvnjhjZ6w20NkUhYdVVAdEOJUx
         YBJ6LsQzit47S0s+LdJvtPqdYTBqNBdHRJADWwlmR3zQM8ft0thdNk2NyAD2euMmzD8v
         A3aK+pZmV5QDai/zz4eTGd06yyrRXUv19261TN0hxnv/fCzN5bIcDTijOuUPqf9wqtNM
         1z1I1G/Fv35ne56gjJcDEzmF8wnxkIMPDZiixnJ5UvGCSpQBQ+HJWmZy6FROu6mEIdpr
         MLTA==
X-Gm-Message-State: AOJu0YyNgAetxeLl0snGGQE2idHtad+XA1h5EphrQLNU5S8/IJyORE13
	AuOSDpYf1M2h4x9HW50wuCMrZcuCuayycARYbo3kbWbxstN4gvng0Bd5
X-Gm-Gg: AeBDieuBVLwc77D1Ylz29ZeoibAhlq2BFTzTH4Ad++6Q6HlbxNN6op7JNj9fdUqhAVh
	17meeRJZ39tWcKk7bqbfNHJ+9mX90wKXqSNIWF7QJScGTJWB/+Jf02gquF4sFE/8Qzr6gf5Q8rQ
	eULbCfuh9z0wRp5jJTTiKGxtVLd4+6C9MQxEQGtiksgH/T3p1KJGjmKyHqTyl8zfYoOJOTinDEj
	adDsq8UFgtRA4buUDiU28hFDHQ6JREjS7xdjV4dgXbFUfgoI0aUFQoKpLk9HJWlnMoaiA5GXlqR
	7OSoXU5s+kScP1qIwr2z1r9gD7jgxVHrtwft/naYU/bShHZMhnEuKXgOriltP23pCCKWlWx4RoR
	MNBaqjYPYAtLacFIckbSlNfHRx7l3yR6zArEJXMGOviGI6UsPPqiSathsRWy5Z8vPoXPWXxYszd
	7vOxnOGx6O+0uNNuq0FFqI1V1pmg0cwZOBV8BlCVWn0Eav9g==
X-Received: by 2002:a05:600c:3ba8:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-48e52bd5035mr38991645e9.14.1778056487414;
        Wed, 06 May 2026 01:34:47 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53895effsm29069145e9.3.2026.05.06.01.34.46
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 06 May 2026 01:34:47 -0700 (PDT)
Date: Wed, 6 May 2026 10:34:42 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Fischer, Simon" <simon.fischer@ipp.mpg.de>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Lowspeed USB device enumerationg under 5.4.288, but not under
 6.8.1
Message-ID: <20260506103442.0ab840ef.michal.pecio@gmail.com>
In-Reply-To: <50fff510499b47d09df9317855680552@ipp.mpg.de>
References: <50fff510499b47d09df9317855680552@ipp.mpg.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 May 2026 07:19:53 +0000, Fischer, Simon wrote:
> I have been able to reproduce the problem with a current (6.19)
> kernel and independent of PREEMPT_RT status. But I have also been
> able to identify that the difference between my Ubuntu provided 5.4
> and 6.8 kernels that leads to the problem, is actually the CONFIG_HZ
> build config parameter.
> 
> Ubuntu's 6.8 kernel is by default built with CONFIG_HZ=1000, while
> the old 5.4 kernel was built with CONFIG_HZ=250. If I rebuild
> Ubuntu's 5.4 with 1000Hz, I also cannot talk to the devices, and when
> I compile 6.19 or 6.8 with 250Hz, they work (currently running a
> rebuilt Ubuntu 6.8.1 with only that one parameter updated, I
> sometimes still see errors, but an automatic retry of the driver is
> then successful).

Quite fascinating ;)

BTW, I would still be interested to see 'lsusb -v' of any low-speed
isochronous device. Can such a thing seriously work with xhci?

> So, a regression this is not :-)
>
> Since I cannot imagine in what way the system interrupt frequency
> would directly affect this part in such a reproducible and
> significant manner, I would think it more likely that the USB core or
> xhci drivers actually use that setting value somewhere themselves and
> maybe wrongly. So this should probably realy go to some other list.
> If you know which, I would greatly appreciate you forwarding my
> information  or telling me where to take it.

Per Documentation/admin-guide/reporting-issues.rst, try your best guess
which kernel part might be responsible and report there.

In short: linux-usb@vger.kernel.org

Regards,
Michal
