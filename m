Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356E7157493
	for <regressions@lists.linux.dev>; Mon, 27 Jan 2025 17:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737998455; cv=none; b=Q36HbYzfOi02a6po/N/GKRKc6rZqmB0FLPAFXaStobLI07lcPP7uGSB+vLfV4uon24se6X71e6CxrhrHzz+LO8z8AfJDaAcWxMikQs50utpgVOsBoWc0tBZa63Ik/6w79qRolWldyoDp3Q1B+tBsBdmiKhPTFof2YoRA6/k+5u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737998455; c=relaxed/simple;
	bh=yqPicxUgCQMEwQTzgfNwfR3qsG9uHV2+cIxR1WbFFdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xt1Qk3Wqg9+yM2L7EvCTph/FQ19QitgEAy20J/O+m9bWyZb3fmiSYGFkk1AfQ92plOrxRZiLwg5ajpdbJeKTm094bqHIsxIKBr+VA5hw1fAzt4IV2SD2dgHRo7w0ADWzjoetk8hqF4OOjeF3qXlnjHon4/XOVGub5GA9Z2Sf560=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aR04RmbD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aR04RmbD"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4363ae65100so52342525e9.0
        for <regressions@lists.linux.dev>; Mon, 27 Jan 2025 09:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737998452; x=1738603252; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=28lhis4UtCxFF+i+kMA+ZCR2L5v7+n/05OVkMSX+dvk=;
        b=aR04RmbDKyPIckjuapGB8Ekww3wMYUzCtXOv7VDqOk/tpqJBDTjWi3I97OYjXPfMtQ
         UohPpdQq1doPNTqn5TZ5ZbFgPjxj7b2TZFSk80bO8DrwmfecsbMXF5f/5fOLA1gP9SjW
         wTnAkZYFAMtkHygfFNcm0FQEJrnWC0ff/+efm4tFjRiV91F9vsxydcsV/T4MYxfmYZL7
         r9fPfFLK2uevNsRFCWsFYXTXVe29c4rQcFwev0kwe+St5LdKIXelp7mlZTNxvb3UrmY5
         dTPCPWL7yTYr5bta5X4zcPtvtbGxq+XTTWh1HTJvtraRLOv5F6TWegcbRVORvMoOWLvn
         zYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737998452; x=1738603252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28lhis4UtCxFF+i+kMA+ZCR2L5v7+n/05OVkMSX+dvk=;
        b=fqhY4GKvIMo6cQK4G1jgZq3cUpesa0qTluLGIhMahqT3eND2CcWP6u3+n565QcLQfs
         AYyP3NuF4jX9GagAy70yNnOmRy5lXCVWSjiYsVxWZKyEHNdv0T9KT/2dbFemaqc0v2zT
         vDinFaSN0teNHRrIjVkaIBoD0nbxxijAtAhE4mFgaqiVe3GbKKgGL7iB4aq4thDMol1X
         7dCoCYkG+Ix6nM1vI7qvkG0z1tfarXBdSjaYZfKk0ax5YbFPZcbpw+vUqEsXsFdQ7Uh7
         VugH9CF5ycskGGO5MQxTVTBQ811avNE64/KWRyJjuyqr8e/r0jgwXf50e9hNDDgxINC5
         nE6A==
X-Forwarded-Encrypted: i=1; AJvYcCWODzCOiS81V/e0PGm2URh2CQtgZhowEyxbJEaeKuxwnPlcq+d8pO3pZzni1Sg41E2RXweHQ9zmNmlvig==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgI0dqu/NEVgAdSoLw5PGpP+Pir18kFOQ5F/7q51F8egcToGI2
	qeevXEx4hDQtYB+eyzDQnhhIzzkFkpcpdKMlRSiRefQezR8vXGqM
X-Gm-Gg: ASbGncshnDgNFNWq0RM42twfJMabEGmajSy/kc/3AXkrSVQinYzaUBSjsU7HArNHRDO
	nAX9GhsZkp2FchYk0LM/g2wWyDyUoQTSwGsfxN6hFjVvsTWfQ1GJcSS1OgrSuXhHGJaDwH5DVEc
	lwVm5/DAzsOwGGk/ZSiR3g2DSqsTWC10CvfiLpUwOTPR28pg9lE9KbsLz8Pf/dO3e5pHcls5/3E
	d35nmM02akjZIHjmIdgOG40fz79fQGYJ8QGznAH3g4FaDqiXUAcLndLevKRvTBbQ1EHuLvzrwDc
	nNlCXk6jH8PPcg==
X-Google-Smtp-Source: AGHT+IFIGDGFCCTrTcCnx+mL8c9X5JFtSEWhZsxLfsbzes6Hwq8V9rn2BPbiep8h5DEXXBw5N3/J6w==
X-Received: by 2002:a05:6000:2a9:b0:38a:50f7:24fa with SMTP id ffacd0b85a97d-38bf57bed8emr43897711f8f.54.1737998452253;
        Mon, 27 Jan 2025 09:20:52 -0800 (PST)
Received: from [192.168.8.100] ([148.252.145.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e64da5sm618850466b.60.2025.01.27.09.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 09:20:51 -0800 (PST)
Message-ID: <999aeda3-5565-44a3-96d4-00dcd91a4cbd@gmail.com>
Date: Mon, 27 Jan 2025 17:21:15 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1093243: Upgrade to 6.1.123 kernel causes mariadb hangs
To: Xan Charbonnet <xan@charbonnet.com>, Jens Axboe <axboe@kernel.dk>,
 Salvatore Bonaccorso <carnil@debian.org>
Cc: 1093243@bugs.debian.org, Bernhard Schmidt <berni@debian.org>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <173706089225.4380.9492796104667651797.reportbug@backup22.biblionix.com>
 <dde09d65-8912-47e4-a1bb-d198e0bf380b@charbonnet.com>
 <Z5KrQktoX4f2ysXI@eldamar.lan>
 <fa3b4143-f55d-4bd0-a87f-7014b0fad377@gmail.com>
 <Z5MkJ5sV-PK1m6_H@eldamar.lan>
 <a29ad9ab-15c2-4788-a839-009ca6fdd00f@gmail.com>
 <df3b4c93-ea70-4b66-9bb5-b5cf6193190e@charbonnet.com>
 <8af1733b-95a8-4ac9-b931-6a403f5b1652@gmail.com>
 <Z5P5FNVjn9dq5AYL@eldamar.lan>
 <13ba3fc4-eea3-48b1-8076-6089aaa978fb@kernel.dk>
 <a2f5ea66-7506-4256-b69c-a2d6c2f72eb4@charbonnet.com>
 <dfc6006d-10cf-4090-aafd-77d62c341911@charbonnet.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <dfc6006d-10cf-4090-aafd-77d62c341911@charbonnet.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/27/25 16:38, Xan Charbonnet wrote:
> The MariaDB developers are wondering whether another corruption bug, MDEV-35334 ( https://jira.mariadb.org/browse/MDEV-35334 ) might be related.
> 
> The symptom was described as:
> the first 1 byte of a .ibd file is changed from 0 to 1, or the first 4 bytes are changed from 0 0 0 0 to 1 0 0 0.
> 
> Is it possible that an io_uring issue might be causing that as well? Thanks.

The hang bug is just that, waiters not waking up. The completions
users get back should still be correct when they get them, and it's
not even close to code that might corrupt data.

I believe someone mentioned corruption reports from killing the hang
task, I'd assume it should tolerate even sigkills (?). It's much more
likely it's either some other kernel or even io_uring issue, or the
db doesn't handle it right since the update. For that other report,
did they update the kernel? I don't see a dmesg log in the report,
that could also be useful to have in case some subsystem complained.

-- 
Pavel Begunkov

