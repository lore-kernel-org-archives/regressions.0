Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077CD4A1A
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 01:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713923545; cv=none; b=BTcNVwNAIEU3DtSfVe0W9TAxDVxLGMSacJZhqYObtrHGX+dviW5SX2efVm1XV5Ht0hyE+7PtoA9oFQP4xzyPdBuWyDjBcAoojiBlXMXPJ7rZq5aT+p1EBt6LtzrryHJxe5byCwVHoPjYkEONdUTiTRXYXGb+/9hjvGESJcQncco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713923545; c=relaxed/simple;
	bh=v2huvPt4AaL2sQUDIqDv11dm8B5mLhIYWfT6KUF/yW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e4BeQbZPrIti8IGafnIjYNYD7kmmwkEMZT97j5nhWwe2vZOQLQnFBq12ECGfU3Ny95VVUwZ27hGhqFc7BFuCQkNTx0Ew62Nx6wEMt42Xsa/LeDWZawTmkPmbgPclYB54DOkdtqscN0p7KRll8+MytibeFzOmTovadRT/9pEoM1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=PYy6HkEJ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="PYy6HkEJ"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2a2d0ca3c92so346564a91.0
        for <regressions@lists.linux.dev>; Tue, 23 Apr 2024 18:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1713923543; x=1714528343; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W8m4U4ObkEYQm9F9towWfztGMNa9exH10VioCW9ZML4=;
        b=PYy6HkEJcRNL9vWRSOim+cBOtemky0m/xRUiRi6B4lp0E6Y//UW4cqREX6zh/CqLx0
         inYpWLZGTdYqnf0MDUl7ztM/CX71KYrsYG/m6fBH0zYkSPvOcSOJlpiLq1EEGUtLgmL8
         siVj7oeh78BacOmThA57nT+FeZP8Wc6yQ0SBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713923543; x=1714528343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8m4U4ObkEYQm9F9towWfztGMNa9exH10VioCW9ZML4=;
        b=u7fpwxXxeUFgffBbCVXVzYQ9YnrCIoXh66d7L+RXY7YYQ/nQr3n8YRaasGgX2gBcm3
         MzLxWWqni8z70IV1ocACoebMLFyGQRQIrjKvMOfKXZWpSkoxK/xSdlvha1GAErZIja58
         bw/AmP63ux5fXRbxYwjiQ2hgg3NsrCYbxTEKtqcOvI394ZjwS/W4+wN6VgXmZwPqLDK1
         uQlaK3m7HsjF8yclZh0yTW/R3IeGh8jdCPn9FAY8jUQ8c0LlG6MbMpHS1wy0NKlwE9C6
         ZFRKkSbZv7NtsNNdfHaOjzG+9VL7pfSlkjeqhZ9f758NGGWf8hZrwwsMM0+M8BWi0Mwr
         gscA==
X-Forwarded-Encrypted: i=1; AJvYcCWADf6FgJCgRajSnaB6vn5XQ5dF+Cr2RiOzRlHn+QuT1S2DgIQGtTcDwaMAtelxcH51Mlltqcc4jQzw914UPbT+LAogM/SMpU1nakA=
X-Gm-Message-State: AOJu0Yxq3r51HRa1PWq251M6v1BrG1Kj89OzTFA5ZZR520J3iol6dl/U
	pj3uoIV/Hfs7IXXB8Ra2R/X3HX1pEEW0uQFoWu77MSFcSeF1OplJGExf5RoCIA==
X-Google-Smtp-Source: AGHT+IHTZVy+ZZQefmF+h21RjSsKaH9d9KLKbHDNlfaqpNcNhxIwRxpSvi31KdoTboCK9Puy0ucd9A==
X-Received: by 2002:a17:90a:77cb:b0:2a5:5f9f:6733 with SMTP id e11-20020a17090a77cb00b002a55f9f6733mr5515449pjs.20.1713923543017;
        Tue, 23 Apr 2024 18:52:23 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id w4-20020a17090aaf8400b002a5e1f837ebsm11837468pjq.46.2024.04.23.18.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 18:52:22 -0700 (PDT)
Message-ID: <41a893b5-8cc9-4533-a58b-cee0099fd61a@penguintechs.org>
Date: Tue, 23 Apr 2024 18:52:20 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Fix two regression issues for QCA controllers
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: quic_zijuhu <quic_zijuhu@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, luiz.dentz@gmail.com,
 luiz.von.dentz@intel.com, marcel@holtmann.org,
 linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev
References: <1713564212-21725-1-git-send-email-quic_zijuhu@quicinc.com>
 <1713650800-29741-1-git-send-email-quic_zijuhu@quicinc.com>
 <369512e2-f091-4370-bce5-9ac32178dc4d@penguintechs.org>
 <a6ae69ad-b602-4cfc-9f76-8932f357d30b@kernel.org>
 <c0f7036d-c129-400b-85a2-1414ec3d2622@quicinc.com>
 <dc17aea1-9399-4c2b-8775-fa0a7f602035@penguintechs.org>
 <CACMJSevocRot6J06uvridRw9MZFftJrkCyYBgXhLnwfapVPnCw@mail.gmail.com>
 <5da9ecae-35c7-4968-9f16-3f10e04c2b1a@penguintechs.org>
 <CACMJSetZ14Pm=m9e1ka+m9pUbSwCfV2agcaWBd7aWJu2ngWmbA@mail.gmail.com>
Content-Language: en-US
From: Wren Turkal <wt@penguintechs.org>
In-Reply-To: <CACMJSetZ14Pm=m9e1ka+m9pUbSwCfV2agcaWBd7aWJu2ngWmbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/24 6:02 AM, Bartosz Golaszewski wrote:
> Can you test the patch[1] I just sent?

I am doing this now. Just to be clear, I am testing the patch I found in 
the thread with subject "[PATCH] Bluetooth: qca: set power_ctrl_enabled 
on NULL returned by gpiod_get_optional()". If that isn't the one you're 
referring to, please let me know.

I will reply back to that patch after testing.

wt
-- 
You're more amazing than you think!
