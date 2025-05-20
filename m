Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBEB25C83D
	for <regressions@lists.linux.dev>; Tue, 20 May 2025 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754586; cv=none; b=ITWb8zrWqz5yvwsiJEvNMPJgtoUCDxFTAx+JLgXqwcod9ObC+SGN6FbPnRcLZ6cq3zMBxWaUK6fuLxMZWtMRiAIZXfGoP+azEehDJQGs9/wtTd7MnHS2Zr06l/in+vAYBP+8cw0duKDKgcuD7usjGf3lvEQDq2wL9x6R044p7yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754586; c=relaxed/simple;
	bh=vEbcuXQwEDRa0vNR50YOWWWtdFUeo4T8qpaWJJxDqHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NonZNREV+9pqinoGBWYyePtCltTon6p9ZUEE8LuNzyw9qPBA4q7RFF7QlCs0pYe69Tke0cmBM4ps+qT9YAp38bwhFAJ5evmUg6jwdZTLYPhsVz/jphL+RT/vhd8GM+hDT/uPOElReZWo/mjAxgLRmXI+khVf+LX68/EXm2uCRVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=PYdrCX5c; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="PYdrCX5c"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-86135af1045so715442839f.1
        for <regressions@lists.linux.dev>; Tue, 20 May 2025 08:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747754583; x=1748359383; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=psPdOjdWIgtZdlDW5hj2GFX8fZ81Dk7SDN2MaI3x7nw=;
        b=PYdrCX5cTih8DkUx3L8+dOoF29qby2cT//WVWyAfOTsaDO6UX7S/F9z5L11yglZ7dB
         F476t+Eaa4DLK01+cRIfHnGQOoRfAxmm+XnxBx6I68fNnaWNF79WbIa3xU2lqRiZkhIh
         7ZGT9r/8V9rTl6PjbGF8rgg7mCYijq8Ez0nOYRmLRyD8KUp2LBsyX6gW3R1kqrx/aPuw
         quzxDpUhB62YpieAXWyPlB2axsaOIRebKPSbzUOv+OnqEQezJCCfmqcDmgsARBiRyaKN
         bYzU+n+QCeCf+MMxBvG6bf/wuyDOlp45Mi1hiwnPMXPUuepQTeBIQ5HgojobP0bhnjcn
         0XGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754583; x=1748359383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=psPdOjdWIgtZdlDW5hj2GFX8fZ81Dk7SDN2MaI3x7nw=;
        b=VrkCb6AoqlBN+xWDEeQvFh/NrVel/Upk+rkXc4QPv/rIsD6IpnxgWk5kHeZVEPWpMj
         tNJO0NvgnXQiTghsoSx6WQP3rWF+eoDCJsZpkeYSM/Zf4JtI5HKJKvdZldZucoFfIMiP
         lamdORF5DrhDnwLTjtI26lkEaX9aVbcf87JdRuMGVahbHcRnzZeFPOV1MhgrBSYiNnat
         e9esS8MwTc3NNdgaYA9duI38wyBv/HmpPWzxbF/K1LpZZJSIi94NmYMIu5GInlpbTQNx
         gdP6LZx1rEOzihVqvV4oboBkeaA3WyinrPIOg0oMni/E5PW+Bc7JpyWBcNF40aelESHM
         L2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXgzY93Tkq5+GqzdSNuVhwYZGAEdsmblJSzX83WgiCYGa7sxkILbOlMtbaxJeUdmXEeZ5Cvs475hzNjlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBUPBwdyTf5N74MaBxA0H3H3QZr0uUAJtbnlkgAL6oFNAakG6s
	hAaChbpWiu53yM+jqOV3lFYTLNNMLLhq540VfrUXRvB0t/WDvPbAAqk5+OADxSclOk8=
X-Gm-Gg: ASbGncsbpfoKJtaerigaYSXUSLNC89xRd3+rK+hEXeqgRyQX41nXxH7Rm2PYmSRgYDq
	qW9iimZY4Hu/JJGAq3Y8ITHl1ET1M9MBlsyPgtfFbDEp4wSkmYisCCql9yTDrKKB5yemtITS6qK
	ghl1x4KH2b4p2Q8Tl2hOyDwAWz0YOVTyaCUg+9tfTDniAzssUH0XAACcazVYyhaqSzMCmOM0xX3
	GDicqXSju54sJhO/pEvZTMvstrXPVakIUrX5B19OhwiAYvyz3lV8euNZylzD4naxUjUpA4X2kRg
	AR4xTuGZjt/Xi1CCX7vOy1oBMHB21+j3uemSXeq94ELbNnf/skOynVuuLQ==
X-Google-Smtp-Source: AGHT+IH5FiH5hdeBYNYfGJRWZ52DOo6I2S1qMZg7FuTAuJBXr6A1ts8mPNDcFL0CI9GiyXU3YCIgRA==
X-Received: by 2002:a05:6e02:12cf:b0:3da:7cb7:79c with SMTP id e9e14a558f8ab-3db842dea53mr165651365ab.13.1747754583546;
        Tue, 20 May 2025 08:23:03 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a556sm2268664173.3.2025.05.20.08.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 08:23:02 -0700 (PDT)
Message-ID: <72139ccf-892d-40e3-8870-2dff0e30ecd9@kernel.dk>
Date: Tue, 20 May 2025 09:23:01 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [6.12.y regression] loosetup: failed to set up loop device:
 Invalid argument after 184b147b9f7f ("loop: Add sanity check for
 read/write_iter")
To: Salvatore Bonaccorso <carnil@debian.org>,
 Roland Clobus <rclobus@rclobus.nl>, Lizhi Xu <lizhi.xu@windriver.com>,
 Christoph Hellwig <hch@lst.de>
Cc: 1106070@bugs.debian.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 regressions@lists.linux.dev
References: <3a333f27-6810-4313-8910-485df652e897@rclobus.nl>
 <aCwZy6leWNvr7EMd@eldamar.lan>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aCwZy6leWNvr7EMd@eldamar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Fixed here:

https://git.kernel.dk/cgit/linux/commit/?h=block-6.15&id=355341e4359b2d5edf0ed5e117f7e9e7a0a5dac0

and will land upstream this week.

-- 
Jens Axboe

