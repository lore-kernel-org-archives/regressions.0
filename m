Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D86386
	for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 15:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711725671; cv=none; b=kufYvoZtx21dtGtho+ulEniUPnOKoeBZSHFnS9qki1TXSYo68YQATY1NkJ42lV3A9efhtOSRtJtDEQcbhlxOoOR5mniLXemkpEz2rstk7SIvyaO4e9xQkr8F2Dad6O/EnCavETjCDNOXObD0EOiGCaPslleGGRP32Y933keSktQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711725671; c=relaxed/simple;
	bh=2YD/CMAbrUGVAP0HPybXV7ApTqLDwTkW8f0hGkdl0h0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=X+Bgij4X5SB+EJ0OAZNPVxbSZicj4zKvVCw+ZkLDUdNOnpju//riVB4n2DZ1BlllmsTClsoSoBdlVx+J2UeRyvMPDoGjXg6mL88Lj3OSwywHZqq+F08pC2jOeaz1fFM1cYWnt36Ah7myP6s+3BSB5RVhk1o9gVCV79mF1zvNxwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtYd49ns; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtYd49ns"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a466a27d30aso263110166b.1
        for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711725669; x=1712330469; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4ZNcLkhCoetnyeaUQXMj5X/oh8psgAL474DwX1Jy6k=;
        b=dtYd49nsjD/yBjLji8CkLcVo+UtKz+51ZHWRiZwc4N/A6HvHjp8X/o/EA4qh7gGPxK
         cXddpiwM3IXs8TGsGbpNhKw1PknubwRwk8qTQDFhPoLZ3crO4Zws8PzlUDKE6tbmvxk6
         1MLdDjfiXz0zBH8TQ+UVaICWklkr9WinPJQdBA0lK+gzyAJPzhCbfXpNsZC46Pnd5XY0
         u6/Zl+ITuB2UkVgFgejHtRY7IQ1osSfZsExAAhjfvyUc7wpsG3GRsUUaqAdYgTewcxMi
         EE7xCCFMX0gqTm1CHbwIoYiIq0lIeMjT++sL6K2c73mh0wJSO0pume1tuwpkkPO7Gbn8
         fVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711725669; x=1712330469;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b4ZNcLkhCoetnyeaUQXMj5X/oh8psgAL474DwX1Jy6k=;
        b=vzJR93nerOQeUnasUumtp2adEt/GzFWHdbWtML8YgInaNo6TSQXapSfuAgf2ijTWxw
         j5LKdrHv70unKAFy+cO3Ag60/TEMpPTfdVXtQoBkF0JMlLRPDDYFDv0/Ku8/VAaj47TA
         5uDGU1P5EQhgN25y542LKX/2nIlLwu3DPwbB+BjJlpa/2xEwtbGPOkkeh6DWxdV/iAbk
         N3S2ATTDi2F59WPUTsTEiOMpRdrinu2+qyGdBkGwJ2QlaMNHC2OAct+4Ylg2I5xeMQZF
         UQaMCJboiafbW6urtGG5yn6eYG0CJxhi6sLhz9sIa8s0K82o+dpnzIW+PItq8lWKnypt
         4ZPg==
X-Gm-Message-State: AOJu0YwGJKrGpqQnTlx/Z6IWkTk+yaJtNjUhKNJN7IIrZLZGIQgcptSd
	H7YTunq124j1EKqpZC0VC50QtwIRkdHJUqsrQbzHNtwHIAfGsCkeU1Ewy0o=
X-Google-Smtp-Source: AGHT+IFK6nWKmBOXCVlZeadYZrCqYsuM0BLFwEpD9HVvqOtfWI8oK3w5X3EUQMV4pmqDTVYwkeG3xg==
X-Received: by 2002:a17:906:3454:b0:a47:4fed:514a with SMTP id d20-20020a170906345400b00a474fed514amr1644434ejb.52.1711725668528;
        Fri, 29 Mar 2024 08:21:08 -0700 (PDT)
Received: from [192.168.178.150] (i58039.upc-i.chello.nl. [62.195.58.39])
        by smtp.googlemail.com with ESMTPSA id q16-20020a1709060e5000b00a47531764fdsm2032012eji.65.2024.03.29.08.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 08:21:08 -0700 (PDT)
Message-ID: <1ee68691-9eb4-404a-adb4-fdaaf12c905d@gmail.com>
Date: Fri, 29 Mar 2024 16:21:07 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: stable@vger.kernel.org
Content-Language: en-US
Cc: regressions@lists.linux.dev
From: =?UTF-8?Q?L=C3=A9o_COLISSON?= <leo.colisson@gmail.com>
Subject: Regression : Latitude 5500 do not always go to true sleep mode
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux maintainers,

Since I upgraded my system (from NixOs release 
2caf4ef5005ecc68141ecb4aac271079f7371c44, running linux 5.15.90, to 
b8697e57f10292a6165a20f03d2f42920dfaf973, running linux 6.6.19), my 
system started to experience a weird behavior : when closing the lid, 
the system does not always go to a true sleep mode : when I restart it, 
the battery is drained. Not sure what I can try here.

You can find more information on my tries here, with some journalctl logs :

- https://github.com/NixOS/nixpkgs/issues/299464

- 
https://discourse.nixos.org/t/since-upgrade-my-laptop-does-not-go-to-sleep-when-closing-the-lid/42243/2

Cheers,
Léo

