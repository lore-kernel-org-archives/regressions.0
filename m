Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6C520E704
	for <regressions@lists.linux.dev>; Wed, 19 Mar 2025 19:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742413138; cv=none; b=mtd/lWKQogZInWUj4rj1aiOnrmEIZcf+YxkRtxwn5TyHowrO+lk0LfPisc+Ah4LYN90DKR9TF5ujTWME/H0JpAQ8UOibMLcxki7I3dmeAB7VVbYlV/2EWB5z7AF2FcZ4esz68IBgzm8HD8lSgEnei73i0R9EMgmZP6xpT+iASGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742413138; c=relaxed/simple;
	bh=1y3R7b0DmD48U1jUhf7ZVBbYaQ7UOT8lO8Rx6BwuKDI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=j+FNyGHf/gNEZPNxYfdAkMo+vuMBic18qEjoTKe+R9lqyHeiUKMxPJckZiCINckqCX9w91O5CzhErRhSQXADr3v3WC+39VRMPg2dWJlD6ZMGiPvJD1Mvw+0rLwFuRNKm/Kr95NKlo/0CpiekmK1ru4hevRKQ8HPfsatdRPFbWeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2yXVeV8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2yXVeV8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43690d4605dso115705e9.0
        for <regressions@lists.linux.dev>; Wed, 19 Mar 2025 12:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742413135; x=1743017935; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqMsXA2Pn/x09AFHqyaJaU4cTDRogMIdyWPLzphrlQQ=;
        b=j2yXVeV8KG7qqkBk7rHTGrkcBWkSO8gxqrNrs3G/UKnnBnklrtsQtchcBVP1bKm56Y
         ntZYctLx3oBEECTw2Y6D/PepFthVINqAIjGNyrTV3LqyeXNY/o5ALNiZ6N+yJvdeITd7
         x8QJBH20vVxo6/GxJdjxlSYIEOrhk3ZydanVuP7Sc1yAZYPTYPD1GIKQ2R+PNc9hsSVK
         DJOLuMO/9IsoEB5bbBmRlBHyRk6m/JuTykTjwgHBCVMuIjV30rM+QKqE3yssECe7UcH/
         juDj/YbfjSsWqT5VbPMNy1S9iYJ1VHs+c44NRCLhHnDQ1QKGYGuy8BgNHxfd6ncTDWE6
         wbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742413135; x=1743017935;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EqMsXA2Pn/x09AFHqyaJaU4cTDRogMIdyWPLzphrlQQ=;
        b=pXm5YsBR6BSWQT9eM4kPY/CrB6q4Jn1X8AlSPxAO/alI5eCDS7FKdQLxkRMnf+dN7N
         TZl8LkQ6Krgpmi+qskUVyanepgTIUTsuCRB/x25+yucjqZB6tuGY2IpEb+H4NawZfik8
         LJ/BqyW3InlubCs781sT6qcPA65GJm9EGdZGjPvYIrLBuzwP3Fu/hqGljDq14uXOJabz
         oNGUmVVUsRbumOlinYuQxhlx04rRVQNoCyMFP4pzQMCbPOvkN4ib3DtO/6k3A/XoyKlO
         awdfmjBeGOzdV5lhcQyrb31ptMQoo9yYcqKxJPZJpjrOgJmXWdF6+q1xBP0+Ykj4/CVC
         P+Vw==
X-Gm-Message-State: AOJu0YygxUGgZMBkdz+oPplabUGukr/dGSAiIxConlWEs4DftvBzLH0O
	sUWZOQYVOS+Qley1rKCNdMR6bAuEE1nvlA/ld5nHVED5U52iU7u3ngs+Pw==
X-Gm-Gg: ASbGnctWqDB+ahkMwJm1ZbBTvHUG7jzPIKJCELo8cV9eAb6er3iKBxQbeX3knMuWXAi
	60VTNUDjhaa8bUdELB6WSulLBld9mh/TsESoRtf+CWb4x9KuD3k7t+CUulO694wZmxjBx85eV3e
	K14G1LZILIYjvX/JYh8Aw6V1WE6YZpbn2AFfVfeVTnDW5goKP5pzwuYq6tedYW4UBlCOn2zKdPZ
	XzzXli/upv3bExKMHjBTmSNH7XIywMqUerIjdV+alQ7tMIqILhyBYDeNOBZSyq/YzGgDh7E7TOp
	mv+lg/RSRtGiGZRzgOqmYV7PKbJ7hN1fRmUtJt2EoSyI+63J4hZfRX4TV1oGA9V2aW1qCRR9ZRv
	ecGKqMO0ABIbx6XayItzE/r6FitoP5PPmPlstmQ==
X-Google-Smtp-Source: AGHT+IFjNhON3VzKjJ/yRrIkI3EbjS7s8oGQsthAMacFWVLycgU9m3c/H7UFW0Bx1krt2a6Y93udgw==
X-Received: by 2002:a5d:6dac:0:b0:391:4189:d28d with SMTP id ffacd0b85a97d-39973af6867mr3680202f8f.34.1742413134541;
        Wed, 19 Mar 2025 12:38:54 -0700 (PDT)
Received: from [192.168.10.160] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f47c60sm26877435e9.13.2025.03.19.12.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 12:38:53 -0700 (PDT)
Message-ID: <415e7c31-1e8d-499b-911e-33569c29ebe0@gmail.com>
Date: Wed, 19 Mar 2025 20:38:52 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: it, en-US-large
To: stable@vger.kernel.org
Cc: Linux Regressions <regressions@lists.linux.dev>
From: Sergio Callegari <sergio.callegari@gmail.com>
Subject: Regression: mt7921e unable to change power state from d3cold to d0 -
 6.12.x broken, past LTS 6.6.x works
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

There is a nasty regression wrt mt7921e in the last LTS series (6.12). 
If your computer crashes or fails to get out of hibernation, then at the 
next boot the mt7921e wifi does not work, with dmesg reporting that it 
is unable to change power state from d3cold to d0.

The issue is nasty, because rebooting won't help.

The only solution that I have found to the issue is booting a 6.6 
kernel. With that the wife gets alive again. If, at this point, you boot 
into 6.12, everything seems to be fine again, until a boot fails and 
from that moment on you are without wifi.

Working around the issue is not very discoverable. On my machine not 
even a hardware reset (40s of power off button pressed) helped alone, 
without going through the 6.6 kernel boot.

I think the regression was introduced with 6.12 and I remember having no 
issues with previous kernels, but cannot be 100% sure.

Similarly, I do not know if the bug is with the wifi card driver itself 
or with something related to PM or PCIe.

The machine on which I am experiencing the issue is an Asus ROG 14 
laptop (2022 edition), with AMD CPU and GPU.

Thanks for the attention,
Sergio
