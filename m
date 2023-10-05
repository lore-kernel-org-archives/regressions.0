Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1CB125CE
	for <regressions@lists.linux.dev>; Thu,  5 Oct 2023 11:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtM76LNj"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3af5fda8f6fso563808b6e.3
        for <regressions@lists.linux.dev>; Thu, 05 Oct 2023 04:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696504303; x=1697109103; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZLz384BnmtZTkRlTbx4zMnrnVvcuSLVD0ixPYcWO2Q=;
        b=JtM76LNjcEbG1TwxXkKuCAu+L0Z7DkgIhfoKZHqZAS8XcoGMnuknm7d2zE2ASNaOka
         ynMtCe1yn6lNk/anZucjazWMVlPpe/MFfzaUluY0U50kUACwEES7JGe/wew3l0M7XJop
         EggW9BrWV6tLV+dtriXoeqwmXwvESZOg03DmFGOiaxOcKmB3wwAbw+cFFhqfUCsL/LDy
         RC7Te3ZTuNDAiPIOCH0qQpEztuyusZWOJ2txEQY9+k5QG1ypsXtoR9L5WEGurEBNe0sc
         tKLnAtppvpE92HbiO/eAiNeFCzGbDvtDKzyaI8eLp+hd1da4mpc9Okuhl9jRvfMs84F7
         OPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696504303; x=1697109103;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FZLz384BnmtZTkRlTbx4zMnrnVvcuSLVD0ixPYcWO2Q=;
        b=P3vGeYJ9dYhMR1m0+iHmBi4xKh6NujIuFxgA5zA76wmKgK/fnwz4hkAfT3hWRJyZG3
         qGQqMGfSQb4Y8NxNSN5AbrVHQutLChNPWRibR3QTany83z9sYbA2FQ3HlKPTx+iNXn5/
         MWuEuo+T6JvF2OyYITTqKJ6WXM9CW3NS1iBtsZm5jPy2rzCEHo8yQMhTdl4Nz9gpi+Qq
         v8VWrh9KZVuQRxgv9x6pNQOb48kbxSlr1HNo+DJBYow4/2obqzDoP3mNdCq5bdVFA/da
         wfBoILGmBDK0wlBzRlzT1KMLIXSXKIbdLcZ9BDFU6j5ulc54tC5dBbReCvMjFP7asJSW
         G5vg==
X-Gm-Message-State: AOJu0Yzvsanl9E/7t1XYp+kVR1YiJENn+SIVBg/S71krRkACR1ee4dtw
	XUtzUy9bgev+HHP5pleWVBw=
X-Google-Smtp-Source: AGHT+IHUEXw1wL4QkSvnckVLi0TTTFo19lB0LVDgyCRKEWOJzXsDiIkSz5Vp+7Yrny8xruGz8dXBrg==
X-Received: by 2002:a05:6358:4297:b0:13a:2fed:337c with SMTP id s23-20020a056358429700b0013a2fed337cmr4966489rwc.24.1696504303486;
        Thu, 05 Oct 2023 04:11:43 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id p3-20020a17090a74c300b0026b50d9aee6sm1282934pjl.25.2023.10.05.04.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 04:11:42 -0700 (PDT)
Message-ID: <9fa3c04b-bd98-4fde-9bfd-27d83132e766@gmail.com>
Date: Thu, 5 Oct 2023 18:11:35 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Wireless <linux-wireless@vger.kernel.org>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
 Kalle Valo <kvalo@kernel.org>, Gregory Greenman
 <gregory.greenman@intel.com>, Pawel <pawel.veselov@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: 6.5.5 hardware access timeout / HW error / GPF in iwlwifi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Hardware: Intel(R) Wi-Fi 6 AX201 160MHz, REV=0x370
> Works just fine with 6.4.15 (and older)
> Using FC37, updated to the latest available kernel 6.5.5, can't use WiFi or even boot.
> Linux firmware package: linux-firmware-20230919-1 (latest available version for F37)
> 
> First boot:
> Timeout waiting for hardware access (CSR_GP_CNTRL 0xffffffff)
> at __iwl_trans_pcie_grab_nic_access+0x14a/0x150
> followed by HW error, resetting before reading at
> iwl_fwrt_dump_lmac_error_log+0x50c/0x600 
> The interface didn't ever plumb.
> 
> Second boot: GPF. I don't have the traces, but I swear it originated from iwlwifi module from what I saw on the console.
> 
> I've attached the traces for both the failed boots, and the normal boot from 6.4.15 for reference.

See Bugzilla for the full thread and attached dmesg logs.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: v6.4..v6.5 https://bugzilla.kernel.org/show_bug.cgi?id=217963

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217963

-- 
An old man doll... just what I always wanted! - Clara
