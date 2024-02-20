Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8C578B51
	for <regressions@lists.linux.dev>; Tue, 20 Feb 2024 19:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708455934; cv=none; b=pUZLBCAxiCZANlh2s88yeTZrqpbTWRC4u3ngyKaUDZugUqK2guU5DyaQY6n8+6pX60T4if+/qw6a1svQN/oFTOqUMkdV0g5QiGI0X+ZJOxTRiK6FniDw0ucpG7tiw/XqcU3uJnxyqF+cyWEDa67hCyFOQ3XGukqSGkC0nzROd80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708455934; c=relaxed/simple;
	bh=d57dwiYN/IUClLZ1zZHaXBEK/xBD1K3nBDTBMz9mmMA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=MMITMIoFBNrLzfd4p5J9XMFPpgF7cPIWV+lM6SenGzH7/dX2XxL4BbW/b2rIGArZqrWmJbOnZn+uCHW5nJV5Npovt3052h/4R83Yxoijx8jxWac8z8Rjb6SsOC4IE9ZnBnC82NIEJ4Of2XHOe2q9AFaYINB2OVINyhjcGLKpWNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDAhpZpK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDAhpZpK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-412698ac6f9so12111295e9.0
        for <regressions@lists.linux.dev>; Tue, 20 Feb 2024 11:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708455931; x=1709060731; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlGVc0x7kVqh/QCLdDBir2xloFdYnUlV85OlUaPZ9QU=;
        b=iDAhpZpKWOAhVtdVicAepZjz/fmCkH7CGQOs2PdhPkSyzJsQ9USTq1S6lCtBu2Nyx4
         fRIRRBs11vHrp9OpyvqqrS5/v+1Z2f885I2qug7CQKCEwf2RDJnulKVPci6GAsR5GFd+
         HepcjgnupKc1p0Luh81NuuTzBAU0Rlgpd9LMTgolX8rcaZUKzVoMqCbdSeWxb4CoJA+n
         aQKRU5ANV7dyXe92JD2RDK3WHfd4HnBrAGkdzKlm+uoO6QEly3olDSi4w8dg8NEp1o7T
         iaBM5MyXiYMvnx01/ALij5wXrbd03m2NJ7Qstvc+Z18sTNi8xeutin21lPP03fFdYGNI
         99lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708455931; x=1709060731;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlGVc0x7kVqh/QCLdDBir2xloFdYnUlV85OlUaPZ9QU=;
        b=sFW2C4sYufWMLz9Ti0IzlKJ/Fw9jHEJv5EtWPuocTu5gwFeLVb7k8XwvcuFljcp6MR
         siV7u+Sh9G6ZzA2mN17jKAPZsOtt7XeAp9iZCu9WlIscdu4I+RG8J3dqjr1O6+SuUtHO
         fnbU9xUPQr2Q6k3csxJ6NfSq6WiJURKoXimqJCodMNgxkLdScrEZR6iR/e0oI0uRj+HR
         8FMzN7t8vcOTrKNX0EN7FDVW8hfHyB0iEnDph319+IzMYWv6ORBRwPSW8uVG9y8spQzA
         letmgL12Ur4MguEsazgcudcNeJiJ71rdnNk652rT4wOIVpaGSUdBiIztdfWM1UB7vFCE
         MEpQ==
X-Gm-Message-State: AOJu0YxUKN40IvsIxvWtBPtU2ScfXFt/IJzzpvpv+XmGIfkKMi/a6709
	yUd2HIbVf0zecNHkJpyNJd3kLlLfwoUzUDCh8w3uLoRbh4IHQxW/rMxFPTtSYC8=
X-Google-Smtp-Source: AGHT+IGAcR+g1idnLlewxTtH6P7zOfyXYpv5CvT6kmRXMqmDv5O12robaNxl4YJgXjzQUsy8E8VQOw==
X-Received: by 2002:a05:600c:3b10:b0:411:aa3c:128d with SMTP id m16-20020a05600c3b1000b00411aa3c128dmr17987166wms.15.1708455931285;
        Tue, 20 Feb 2024 11:05:31 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec5f:c111:befe:8ded:1f46:cf9a? ([2a01:e34:ec5f:c111:befe:8ded:1f46:cf9a])
        by smtp.gmail.com with ESMTPSA id hi16-20020a05600c535000b004126ca2a1cbsm3916582wmb.48.2024.02.20.11.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 11:05:30 -0800 (PST)
Message-ID: <0877c4fb-cb32-4dd9-b0a4-6bc306384979@gmail.com>
Date: Tue, 20 Feb 2024 20:05:30 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
Content-Language: fr-FR, en-US
From: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux Regressions Mailing List <regressions@lists.linux.dev>,
 Linux Input Mailing List <linux-input@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@jikos.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Mikhail Khvainitski <me@khvoinitsky.org>,
 Linux Stable Mailing List <stable@vger.kernel.org>
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
 <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info>
 <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
Autocrypt: addr=raphael.halimi@gmail.com; keydata=
 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
 Wxcwwn0N
In-Reply-To: <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 20/02/2024 à 19:12, Raphaël Halimi a écrit :
> Confident that I probably pinpointed the faulty driver, I simply looked 
> at the file history on Github, and saw that those three commits were 
> dated from after the time when the bug appeared ; moreover, the comments 
> did mention stuff related to wheel emulation and spurious middle-clicks.

s/after/just before/

Regards,

-- 
Raphaël Halimi

