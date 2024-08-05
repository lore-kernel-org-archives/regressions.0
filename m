Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA1E15B55E
	for <regressions@lists.linux.dev>; Mon,  5 Aug 2024 18:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722883684; cv=none; b=Tb3oR1rVqOk4h2m9O9tM6WwLXwLa04H62jkhDEH4NsXTzfhTTlhINywuvXQhc0EylF/bl4ugllBVuwUpfiBGLqdfZnNQirrppd6Skitu9ZEhgrlzvE4k/P9hBXQJ+NyoQsqngk7EU0/GqhRyh7BrHMQQWd/LR2Jnlweql2NKbOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722883684; c=relaxed/simple;
	bh=2FQvdAEz9c7t59DnbbJlR0dBMhbPZ3sABY47I8zXsxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OhUkfAoYFn9OfOFFpPnHfyLl/t4hSyXMUT+WAM7G7ZpCCjvW4f8GYW5d4SrSEfAxNEGFhLu8YhIhoTgkq15KdS+6fGrw2nJ+le8cCL4HVImNKLlOWvFnUJIhIRaUy6eqDgr7gxNu02cN7ufKNIEIGR/jJ8jP0Vi6dIN7SAoWO7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=WZHTs0o7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="WZHTs0o7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fed72d23a7so81001545ad.1
        for <regressions@lists.linux.dev>; Mon, 05 Aug 2024 11:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1722883682; x=1723488482; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HMNhcFmSQ5UcD0HqrK9ywZFFx1lvm5X7nz0EGtEQvgE=;
        b=WZHTs0o7D4InejWRTP8tBzKD0Cwc76o3Km96wg+dRFwiNNyGtori5JOUsYGTRC4ods
         szmjj2e+8mu/bFXbTv5z42dWrPyQX7J7n8BcqKJ2Sftp+Mn5eKdrPAL73PkcvqiRKdMH
         8NVEPczzClLh7rVnOEA+D/20hNQsaZGBFgSwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722883682; x=1723488482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HMNhcFmSQ5UcD0HqrK9ywZFFx1lvm5X7nz0EGtEQvgE=;
        b=CdRD/fg9wasyZd7m1s/UjvwrVmXGBzrHzSnJ7wfU6rVPvFcD4P4nuEiuJDWPQ9Q9VV
         e+N3WpKuADBqS3lMSR51isB3xwgIkS88btByKlNBDrRuk30qklHri/GSSxu2SnO0SR4l
         q9jpbLS0mq+u6rMQsS4PuteNImTYo1yHjQNyDRgya9eaCRRt2GF8yoacnuCg6TcuwFKd
         gey/iki/96YZxTTzSBPgyQArHk8I2Y6q68Q3DKhbIHIcb80bDMHlvWmtUb4YSGE95akQ
         acjf8FiHQNeqkUDA1hMoFN05d4jw3G5fMmAhdDC6EH1xn+bdcm7D/zNmkrlGijkXCIcs
         pFTA==
X-Forwarded-Encrypted: i=1; AJvYcCW+u0vX3mZqX+GvrHc+VnYTPFyrY6pSWO0Y8I8alm5Rk8RUZ2RKleM5ATIyxU6Bnksc5VVVeTHIZLlUoaytehr2Wsg8TZr0Wa5lvSo=
X-Gm-Message-State: AOJu0YzmQM/4NCJ0udk+4YMAutdDiW2DZ0g5rwkOjEKCOnx18FoyJMZv
	o63JCu5nvIrKVfsrCU1GWeVdrzu2aWX34IzM8XVcnOBv6IW6meny4vqjwZ+4ew==
X-Google-Smtp-Source: AGHT+IG6eJZSfymiHUYaiCyEcgd4DWhLixPN0Fdi6UuKMBSdGRmp8Iyxg1Awy5Vo4qrVRA8fUmwptQ==
X-Received: by 2002:a17:902:d503:b0:1fb:6616:9cd4 with SMTP id d9443c01a7336-1ff5735b795mr130933825ad.38.1722883681662;
        Mon, 05 Aug 2024 11:48:01 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592978f2sm71938845ad.255.2024.08.05.11.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 11:48:00 -0700 (PDT)
Message-ID: <98e263a2-ecb9-4228-82d3-8bd35636359f@penguintechs.org>
Date: Mon, 5 Aug 2024 11:47:55 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6390 broken in current kernel
To: Zijun Hu <zijun_hu@icloud.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev,
 Paul Menzel <pmenzel@molgen.mpg.de>
References: <27e6a6c5-fb63-4219-be0b-eefa2c116e06@penguintechs.org>
 <CABBYNZ+vVFUm1Tb+BvViYMJd6XQczTYPgyO++GGbCcWrkaC4Kg@mail.gmail.com>
 <30319168-9456-49dd-be27-480b2a068fe3@penguintechs.org>
 <1a519b2f-f5cf-40b3-8223-162dc04f8ca8@penguintechs.org>
 <21645f07-da90-4441-8dbb-d999298165e9@penguintechs.org>
 <09962266-9b55-408b-8b5d-d2387c871eef@icloud.com>
 <0940abda-fe74-4009-9a83-7384bb8cf103@penguintechs.org>
 <1ff58133-7322-47fc-b3db-6fe4a697aefe@penguintechs.org>
 <7e447839-4976-4d3b-aee5-c0961637deb5@penguintechs.org>
 <3996ac6a-4b9b-4049-83e7-530eb49616de@icloud.com>
 <9fd98bc2-d19a-4ad2-9f0a-02baae89ac08@penguintechs.org>
 <34b74dbf-d57d-473a-93aa-ba970f4e4b7b@icloud.com>
Content-Language: en-US
From: Wren Turkal <wt@penguintechs.org>
In-Reply-To: <34b74dbf-d57d-473a-93aa-ba970f4e4b7b@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Zijun,

On 8/2/24 5:08 AM, Zijun Hu wrote:
> actually, my first reply is earlier than the other branch of this thread
> as shown by below link (^^).

That is true. However, the source of the regression in this case was 
Bart's change. I was also trying to make sure that the discussion didn't 
diverge. I meant no disrespect to you or anyone else.

wt
-- 
You're more amazing than you think!

