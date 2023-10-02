Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8457E18F
	for <regressions@lists.linux.dev>; Mon,  2 Oct 2023 00:11:21 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-69335ddbe16so4974056b3a.1
        for <regressions@lists.linux.dev>; Sun, 01 Oct 2023 17:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696205481; x=1696810281; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIeMQoi8QBaB+nwPjIVi58PASB0t9qKzyA1DxUjQEJw=;
        b=MkZwKfPRi+kQaQY2IlDqU2G+f64wOJ1zDFXPVTvvInEoltCDVzzFwUM8d3uv/x3ZAK
         yEVtvwSjscUSz4q+NEDTB04Jtt5s55xgWigKkd7JRv7UFCFKBESz4i4rDl20bgqx7ljP
         HBNxuB6oQLfk3RYlFCYd/mxxQXwvD2v6spbZ6nPLFkz7itkNy/jSBeqnO1/5WaXdabCT
         muaYS/dMMO1mCfc2ts6Uf9MFP6rr43KFtcRtQHM5IQK8lnVBH6N2FKfS41W74tAF1XYX
         Yz6r48g3TxoxQXsoSx8ChAvu1VDhQ78/WcKFTENOPc1WGtJXdRglYqEIvJke8lHXe8uV
         zvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696205481; x=1696810281;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VIeMQoi8QBaB+nwPjIVi58PASB0t9qKzyA1DxUjQEJw=;
        b=E/i0Au8bGMH85gYGh+oXVf4sATGf09NMYx2hy2QtpWbOziuzlEVCuXaLdlWhjrqqgD
         VvhVKq6Ebmmhw3puQus257LLFrgU/cGPZ30kywHfgNl0EUJ+eOSBhzwG+S8B8N6g9KhH
         CQNjS7y+Yko/PlrKcfMNKi5wiZiRtmgPQx7TIEwT0+i6OL5XnN2WIda9sN9SRzjX2KQb
         27CJibZOZ1i9U5Hw+OO/5MAt2tRgsJpD563NNSmN0q/2UjkvJfU3LC+eFPF2TCCIeTBK
         AA00eteb99Zn15SqNLVN+IQXp2T7iP3l33KZKpIkb2tAtOIp3Vloi8Ksu4ka54spT1bj
         UIDg==
X-Gm-Message-State: AOJu0YyJgC9uiN9cMeqLzq6V1wiIP0FLUJPNmn5l/Y+qP1DHDLA4uHYP
	ViZvGaRTJz6/mLFnshbahTI=
X-Google-Smtp-Source: AGHT+IHFJvgcO6flKb7/yHNDIK1vTFu3smZotdPeIA/oCOYBhQ73JmK42VMb03xGAWU+89kmOfuYsQ==
X-Received: by 2002:a05:6a00:2e10:b0:691:1eb:7dda with SMTP id fc16-20020a056a002e1000b0069101eb7ddamr10552347pfb.7.1696205480810;
        Sun, 01 Oct 2023 17:11:20 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id q26-20020a62ae1a000000b00689f1ce7dacsm18539800pff.23.2023.10.01.17.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Oct 2023 17:11:20 -0700 (PDT)
Message-ID: <bcfdaf76-8d0f-4365-9ad9-a8b285dc70dd@gmail.com>
Date: Mon, 2 Oct 2023 07:11:08 +0700
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
 Linux USB <linux-usb@vger.kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Oleksii Shevchuk <alxchk@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Linux 6.5.5 - kernel BUG with ucsi_acpi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> After update to linux 6.5.5 I observed several crashes during bootup when USB drive connected to USB-C hub. To find out what has been crashed I enabled EFI pstore. Unfortunately there were no crashes after that. However, there are kernel BUG traces in dmesg. After several experiments I found strong correlation between ucsi_acpi driver and the crash.
> 
> I blacklisted:
> blacklist typec_ucsi
> blacklist ucsi_acpi
> blacklist roles
> blacklist typec
> 
> Two dmesgs are in attachment. 
> 
> The messages to search:
> ucsi_acpi USBC000:00: possible UCSI driver bug 2
> ucsi_acpi USBC000:00: error -EINVAL: PPM init failed

See Bugzilla for the full thread.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: v6.4..v6.5 https://bugzilla.kernel.org/show_bug.cgi?id=217960
#regzbot title: ucsi_acpi boot crash when USB drive is connected to USB-C port

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217960

-- 
An old man doll... just what I always wanted! - Clara
