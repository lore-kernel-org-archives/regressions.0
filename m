Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B5C79DAA
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710244622; cv=none; b=XbjbCBtUIceGmTsUTSajKAalw6QV/6+moHl5NjLhHQI2ciT4dXlr8ApaL4mkvenQL4NKKMtWMg0cvTNfXLe87oDAEoYNo7g6nqGNf6J/hJYArpdgyG1wAGGsDFR8zIfvafp2YNxdmqekpx57hx4VwiJXEXWDW0pQ0+CB28cSuoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710244622; c=relaxed/simple;
	bh=wfW86cAWjuHv8tAgpmI7qyE2JitkFD6Ruc75dc3RV50=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z/1xxjJ6+lh/R9T6s8aEhndvd2PRKddqx95vSmyo8vJbYdJsgR1sc8VExqHv3vRPG5L48pCD+dphJNQiAWSxVnDfj9c+tyhhprXHhMIQ/qlrX5j6IsE0Is/O+IZkmp2EU+4jXHxuWUbZJV9ubkYfs3qUJ4TEcAnWmUHsAb+3NkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+0YmMqo; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+0YmMqo"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4d33dd7d354so756587e0c.1
        for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 04:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710244620; x=1710849420; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cn/VEXIH6lQ92zgU3vkBBRVaJjpWDSl6DhJmBBWjxpo=;
        b=Q+0YmMqoZ0KyiKs7jqGsKYCkzJ754cyWG7HZtI2yqTPrukT0YR7VPEsgQUaD7eSdZd
         TyqjAQUvBB2MY8VdU1p3nVFw1g0Xj8PgNjU+I2Tw703dcKCNfbz6cHsWobaK1birk9h9
         Br9XxQ0SzybWO5rZXEqkUYmZGZEslx6dVrtLK6p6BYwsoFrq0AwaVnWsazxtJAcyBAD+
         vWKpN1S1p7a3eZ+/Sl6FTUAXnZpYn0g+0tVOySwJWFJQTtScv3qWWQfx4oDUPBGmeyGr
         kEgABlrBPewqjKXpaVKP1ASFa7oJNJ2hfT58q1IuKCbMZlBOkL62a367E2d9s7H4PX7A
         JpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710244620; x=1710849420;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cn/VEXIH6lQ92zgU3vkBBRVaJjpWDSl6DhJmBBWjxpo=;
        b=TyjUDeTjVb0YLZo8lZCmU3q0t8/KEOziLoRZsjc3YJoSY4bTCBnqWAJt42vudLHayp
         CwF6Q/GOFF3KSJXzFuVP9s29k5a25umxdJNT0itOMymFTLo17ytBY/gnKb9jARVbs0Hd
         J8jGAHIajX+HdfhaTYdTlf8DkBxGKsMiHO64L98TBGeB0DQmWnEkOMj/PpNcztYn+oLQ
         GCtUy8dK7MhEFgRBzHruzt2jLZLA1XH5d4dN+SpS2MiNiOzYSuWYDTb5v10SVJTFMlB6
         dTjM68YVlmaZ+LT3lKmgsJ0dSBv3XFy6U6VsZi/hZOK2v4GI3oYzKI03q4D/AsQrs11i
         FU9g==
X-Gm-Message-State: AOJu0YyzgKJmJajHf657Iz0p0XRKm5phn9jZpCPm6/wFM+mCWl0/6pQN
	r2tSTbWOyv3DTNizK+9bpyCh/u91rMl0iSVM94Mu6zgcxXMMLX2b
X-Google-Smtp-Source: AGHT+IFItdNRzQJR0nSD1zbVMjsWP4NZsO2D4yJ9dZIwUzfCUb6SFRA6bSjvBeegyLddddX5tUE0vg==
X-Received: by 2002:a05:6122:169f:b0:4d3:5eb3:f64f with SMTP id 31-20020a056122169f00b004d35eb3f64fmr6064767vkl.9.1710244619793;
        Tue, 12 Mar 2024 04:56:59 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec5f:c111:da0f:dec2:677b:7567? ([2a01:e34:ec5f:c111:da0f:dec2:677b:7567])
        by smtp.gmail.com with ESMTPSA id ef23-20020a056122481700b004c07cad31d5sm879739vkb.3.2024.03.12.04.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 04:56:59 -0700 (PDT)
Message-ID: <9a55659c-86a6-4d9a-ab4f-94fbfb72e7c4@gmail.com>
Date: Tue, 12 Mar 2024 12:56:56 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
From: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
To: Mikhail Khvoinitsky <me@khvoinitsky.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Jiri Kosina <jikos@jikos.cz>,
 Linux Input Mailing List <linux-input@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Linux Stable Mailing List <stable@vger.kernel.org>
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
 <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info>
 <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
 <7a5fc584-1520-4e52-9c77-d67a656524c6@gmail.com>
 <10022b0c-89c3-43e1-89ba-00e458fe1dfd@leemhuis.info>
 <7a8d9d60-a151-4b25-882b-48e6929339a4@gmail.com>
 <9db59ae4-be28-4ab3-a2ae-0b0f661f56be@gmail.com>
 <3bb95fcd-65cf-45dd-8d81-1a41b1ae0288@leemhuis.info>
 <CAMMabwNo_yT4S3LaMV16Rmj6MiWL=TRYtB9wspfs_LWVgM=U8Q@mail.gmail.com>
 <b30dc4a1-57aa-4ff5-ae52-7a01203b8be9@gmail.com>
 <CAMMabwNVwapthrDkCLOQsWkObzvTKVzDMiod3KPVa1hoy0CzRA@mail.gmail.com>
 <0d2b0c46-4d84-4279-8964-589d77435e6a@gmail.com>
Content-Language: fr-FR, en-US
Autocrypt: addr=raphael.halimi@gmail.com; keydata=
 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
 Wxcwwn0N
In-Reply-To: <0d2b0c46-4d84-4279-8964-589d77435e6a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/03/2024 à 17:09, Raphaël Halimi a écrit :
> Thanks, it's done. I'll test and report.

Nearly a week testing this patch (with kernels 6.6.15, 6.7.7 and 6.7.9, 
following Debian unstable updates) and it's working well so far.

Not a single spurious middle-click, which is not surprising since, if I 
understand correctly, this last patch just disables 46a0a2c and makes it 
optional, allowing to enable it on demand with a setting in sysfs.

And I have vertical and horizontal scrolling with the middle button 
working reliably (I'm not sure of what you mean by "hi-res scrolling", 
is it about 4K displays ?).

So as far as I'm concerned, this patch should be included ASAP in the 
next kernels releases (both latest and stable).

Regards,

-- 
Raphaël Halimi
