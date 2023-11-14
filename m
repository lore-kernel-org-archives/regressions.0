Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D072FC2D
	for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 23:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWwRtqCI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cc34c3420bso48975755ad.3
        for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 15:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700006352; x=1700611152; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U28cHFzBVkR11z4RuPSvS1sL4RTNO+cnLUGQEPnb7SU=;
        b=GWwRtqCIpcSS2JzN9kMt5m871bfv1Dv87lT7bcZ/jcwXJAOmoRtQ5TKK7k8SGA8eCs
         eezdw2SWVMtjFnS+chPM5Eo1vjwQKkaSVRiNFjgT8C1LEh2wHIcXZYxLgVq5/bemX5RE
         Po6n/rj0ip/LqsgeaX092f0rOnvEamwYEXQffazr73fDrmwUCwsJFr9V2Kyd6zxZIPTe
         9U099XWLCa+aS3LmkZ/JX8yR6oF/MJY5QRL+JK6BU40T3WlsVjDzmczsrpTJ3tTxxxQh
         H3gujhXI+DrGXnHIavF3fgEVKnTeqyJY+vwpY3m/ko4C2pWZRMHGGe3WN0DdN0HC53KY
         NSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700006352; x=1700611152;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U28cHFzBVkR11z4RuPSvS1sL4RTNO+cnLUGQEPnb7SU=;
        b=m+jKlMn5busjeEfb9E5ivZDTyxM819SB9qH5WsP/4w8+hy7ouUVLWiJvFF0NIkTNXM
         Ed8byjtA9/ld2O+hP+fn917VWk+va8oyXAzeFsbWKTSW/S1UZ6HFdsD3WNdKNWqoAnII
         o11hoZuwIXmbLT8YnHsV8nQLDXjTD9WiAhUmsLw3o97NC3uQ+jGQY+oYZituwIH8HmQX
         KrOS7pR1TvDsX4p1K5oGuk4Gia/mep5V6CqoZLkTbYzgb6jYVV5KFDVGbGalS3cNAAYw
         TsxsW0DeK4zT7sfG5P9anN/qkxFEny9/gk8w8BRdz7KvXt7tCrLA2nA2wSwvOo8OG+PA
         AvDQ==
X-Gm-Message-State: AOJu0YycHQjWFNmfSMY1BXQnyuzUcO3dFIQtWO74WEv8hfOYveZcLmkj
	FVoUGZLvo5MMmXc973E9RDc=
X-Google-Smtp-Source: AGHT+IFMeftzfcV39U6BZ/StdmHwqGFz5CwiraE6RrTHkQW6l2CoWrog5MrXkcFrCsLrAiB8ZOrAjw==
X-Received: by 2002:a17:902:6808:b0:1cc:3ac9:7189 with SMTP id h8-20020a170902680800b001cc3ac97189mr3780268plk.7.1700006352543;
        Tue, 14 Nov 2023 15:59:12 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902d50600b001bc21222e34sm6190560plg.285.2023.11.14.15.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 15:59:12 -0800 (PST)
Message-ID: <986716ed-f898-4a02-a8f6-94f85b355a05@gmail.com>
Date: Wed, 15 Nov 2023 06:59:06 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Linux Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Jay Vosburgh <j.vosburgh@gmail.com>, Andy Gospodarek
 <andy@greyhouse.net>, Ivan Vecera <ivecera@redhat.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Anil Choudhary <anilchabba@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: sr-iov related bonding regression (two regressions in one report)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thorsten and all,

I come across LACP bonding regression on Bugzilla [1]. The reporter
(Cc'ed) has two regressions. The first is actual LACP bonding
regression (but terse):

> Till linkx kernel 6.5.7 it is working fine, but after upgrading to 6.6.1 ping stop working with LACP bonding.
> When we disable SR-IOV from bios , everything working fine

And the second is out-of-tree module FTBFS:

> Also we are not able to compile 
> driver: ice
> version: 1.12.6
> We are getting following error.
> 
> 
> 
> With inter driver code(version 1.12.6) while complaining I am getting following error.
> /root/1.12.6/build/src/ice_txrx.h:363:29: error: field ‘xdp_rxq’ has incomplete type
>   363 |         struct xdp_rxq_info xdp_rxq;
>       |                             ^~~~~~~
> /root/1.12.6/build/src/ice_main.c: In function ‘ice_remove_recovery_mode’:
> /root/1.12.6/build/src/ice_main.c:1540:9: error: implicit declaration of function ‘pci_disable_pcie_error_reporting’ [-Werror=implicit-function-declaration]
>  1540 |         pci_disable_pcie_error_reporting(pf->pdev);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /root/1.12.6/build/src/ice_main.c: In function ‘ice_probe’:
> /root/1.12.6/build/src/ice_main.c:7046:9: error: implicit declaration of function ‘pci_enable_pcie_error_reporting’ [-Werror=implicit-function-declaration]
>  7046 |         pci_enable_pcie_error_reporting(pdev);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[3]: *** [scripts/Makefile.build:243: /root/1.12.6/build/src/ice_main.o] Error 1
> make[2]: *** [/usr/src/linux-headers-6.6.0-rc7-vdx/Makefile:1913: /root/1.12.6/build/src] Error 2
> make[1]: *** [Makefile:234: __sub-make] Error 2
> make[1]: Leaving directory '/usr/src/linux-headers-6.6.0-rc7-vdx'
> make: *** [Makefile:174: all] Error 2

Should I add the first regression to regzbot (since the second one
is obviously out-of-tree problem), or should I asked detailed regression
info to the reporter?

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218139

-- 
An old man doll... just what I always wanted! - Clara
