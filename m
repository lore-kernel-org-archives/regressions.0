Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758B9449EB6
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838232; cv=none; b=k1qTEK+3t1ws4nZBWTZ7cvZ072V5ty4Edt5JKjWtXGipxdb1YWUNGWYh5Wg2H6mACixUSsyuYyGgiJFTTkpgPs+yCiYhdQBBt6wjAAavdxT8o0SCzQbgD3nvKPoBepyTHhrVBG+mbRwVQ7i1+RyGSD+xqi8Vp5avbV2/naZAZbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838232; c=relaxed/simple;
	bh=rQadTISyIyt+64+NYnKtupY0oo0nC4sKeX8xC6U+has=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hEki7GyYuCxIv4DWvvVq35xCRicTBUnk7Ofk3F/qh0U8Dx4aUdD0fiBYo94q7ZhXFamKmOQpyZShTK55B0IK3QkjNG+YEz/Gd8XD1rhH2rlTyJPGQ0S97egCe/Hxqp7PLLW7ISSnsJQxGGFAj7PeE6b25ycXoy+IbqAZghKSsS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYefBp9E; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYefBp9E"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a051b73866so7075278a12.0
        for <regressions@lists.linux.dev>; Tue, 04 Aug 2026 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785838228; x=1786443028; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQadTISyIyt+64+NYnKtupY0oo0nC4sKeX8xC6U+has=;
        b=ZYefBp9Ea3uWl7OHW9sZP21LIN5wj1WP4qNfS5nZUaFntL6MKP1sYgQNukYABEjgZo
         6fghz0wVGwndvjtenSWDBz1jtXMO2I6cstDJ2XfGnKOrge8LGck+ZB/n0RWQKNqKq6SQ
         oZ67a1a5dNqmgOrlLwGguYB3v/w9APkFXrHtUVSuDl4lXISRG/mQ9vx0dYvz5eT8Od//
         id7lLMOYJCV5L2gYKyIg6BMPhR7VbwBV8mOgl6NQX4kL2533cIPUShQzcTx9vbhLYGoB
         Sk1f0dNEeYgc9W7hkygtTFh2NT/aT1kv/D+4QSqjeoF7YNE3iF8aVC2hMCGfHPe79klE
         fmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785838228; x=1786443028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQadTISyIyt+64+NYnKtupY0oo0nC4sKeX8xC6U+has=;
        b=RSiaR9RXPopqCw4QlEqBT4QNF0Fyx4r/kC9WRIx63VbuSXZEJ9meQuK1wAN+0r4Osw
         zEGU0ny/lH6dLicfi32RyTUAG90py8bjS05en+LDwJqLgRxEAMpTWzRn+cvjXanOoEqW
         IuXDgwV9uyT6kYLV/7bImo2elt9j9U7aIyGEBVALv4Sr//L9kdUqzFIR7S+2b1VivPg5
         a7iCoKEE/n0zP16HPFjDb+nAedGBb+rL3bocRnO2AO7++WC/Ak2O3CLs4u0mvgRfvFBv
         +IrSOv7Il1N8h+ERVRUGwcUaW6cxBRIArF17rRctHeW78CiL4wMrkTnsVihdBwoBFkdL
         kXhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJnrq1qnYA8/JfzkYaAZxNZbjjRptMbc8Hp+HhSGaZaX/R65O0zc89ljyawy05YPYP6/p4VaKqkXrsDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuXHVsnREGSQcPT0+ygORFUkWWaVeJ0CxI80U0tGkODwV3klu3
	bp4WTqywS9Gto9Ts156ep5Wd2g/UqS7ZFJah8tT/IdsnYFmDBVU+ago/O8vRcz0m
X-Gm-Gg: AR+sD10q5z8koHVTQSyvzIa1bwx/e9RssYSS7raOl1YJ6k2RnY+xUj+LXBc1Cr7vtfo
	kH01V8jakuAkrzu4n6CIDm374WuolyfhGE7sD+mTXXee+mz/3eSaSiD2xzTNibTGfxounNgbLKA
	T3/ypjCVJg9X4aI2Qx4CJqKOxNdkRmYJHWTZHcJnmkbV/3ie6pTI92bspupYmpBRBFsfEvv/svj
	9BfpypVrbj8o6nkuy6c/oyfcHOLnjLE4g1sfMZg9rrWaQSTBrPgR7msbdu0DxnRbUK0uL3DOggQ
	yuCmh7pYrYJWFfRWN/Q9e7THXQ+G7/DyMRrBNjeiBUsX8qfPGPU7c+i6C9lT6mQaxFsGp8eTxE0
	5IP1oQP3vt6wHSBJDA60queJJlqxIEzRGKjiT9RAoJcwY8vML3YRb4jGtdW1ikx7Gkue+L1iRKD
	CcN9aKAc8ZrXiwERCDdFdVGaN/q+nmq72W77emAJpUGc/U9m7hYKg82VYi
X-Received: by 2002:a05:6402:4591:b0:6a0:a492:1f46 with SMTP id 4fb4d7f45d1cf-6a0a7c61027mr11459221a12.8.1785838228405;
        Tue, 04 Aug 2026 03:10:28 -0700 (PDT)
Received: from [10.0.0.5] ([59.152.127.200])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c63daf7sm6419448a12.18.2026.08.04.03.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 03:10:27 -0700 (PDT)
Message-ID: <a532b34e-ec46-471b-b755-b60cb16a7dda@gmail.com>
Date: Tue, 4 Aug 2026 18:10:20 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb controller fails to initialize on intel s1200btl
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: rafael.j.wysocki@intel.com, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
References: <3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com>
 <CAJZ5v0h1kqDEBYk0k05rv6f2SJ7g+TN4FhBDJYZSVUctu-0FdA@mail.gmail.com>
 <daf0bb9b-246d-437d-87ca-16706113b201@gmail.com>
 <CAJZ5v0jByxtQ2tmNm_ZyyBnDMBNjuqQwD_367NRyGNzF7wQtRw@mail.gmail.com>
 <7792f017-42b0-4a09-9941-5259138e21b1@gmail.com>
 <CAJZ5v0jCFFNuG7WtCE2CG+hP=YNsYMdXH_945QgkgAUcr4Lryg@mail.gmail.com>
 <37daa35f-06aa-49d0-bf0a-1b5ac9f44c89@gmail.com>
 <CAJZ5v0jyy0+hqU3=gmBrgMzLBVhdUQwDj8d0_jGCqZwqyWT=_g@mail.gmail.com>
 <588c2e18-e6fb-4fc1-95d5-7a5dd0f556fe@gmail.com>
 <CAJZ5v0gXtKEaNDdSRqd57zg9GbFN-VDHrU5-=EEQPdSa9Zk-xw@mail.gmail.com>
 <CAJZ5v0g4ctzLpEro2Mu7EbSo8RNmYUCM6+J2p_ExCXseQAx13Q@mail.gmail.com>
 <1da0b5a8-336c-455f-9098-a8c834721039@gmail.com>
 <CAJZ5v0g6He-X-C1Ctr4nsnL00mgLiD1mThwyX2jhUj9qKV12+A@mail.gmail.com>
Content-Language: en-US
From: Julian Silver <mendaxca@gmail.com>
In-Reply-To: <CAJZ5v0g6He-X-C1Ctr4nsnL00mgLiD1mThwyX2jhUj9qKV12+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-08-04 02:51:44, Rafael J. Wysocki (Intel) wrote:
> https://lore.kernel.org/linux-pm/5120454.31r3eYUQgx@rafael.j.wysocki/

I have tested this on v7.2-rc6 and it looks good to me.

Thanks.
