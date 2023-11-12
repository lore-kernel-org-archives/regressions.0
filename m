Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEA98BE3
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 11:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bX9VrStL"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-53e08e439c7so5882238a12.0
        for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 03:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699790091; x=1700394891; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2DZbbvQgZ3WGZG+hH0YvUjerJussWDHwFzqgXHTwen0=;
        b=bX9VrStL9CaCOOGV85gqQ543RczhcLhdmhb7V7/KRVy5Nrka88+5dFFkoKnvv6KmKD
         /vON9596gf80/cYnEDN1JOnXANOyPlWfX984OS7SM/fX55AF22XdLi25LertWzQSmy5F
         rRQnpea3jKDNs7ex+YOslm//p7fp9h4MO2gqyBjJRPfu4AEwWrCmSX8TUJ857L0Cm5RM
         CcWaO9Zmq5KI8Nt86xhIaCKRicvF52qYDxoy1nb3zgs6Ed4iOH9FctEUeDDwJ0DsZRSY
         bfDBJbUDbdp/tFqtaN5Lllijkvempyge4GfDI4ar3PKI1rWzon39H+shhtW8q3uVJ1h7
         ztxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699790091; x=1700394891;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2DZbbvQgZ3WGZG+hH0YvUjerJussWDHwFzqgXHTwen0=;
        b=WY/o/bFczy7vrPPZ/CcSKmbNuQKivGva1PjB+SRdGqrbpRbc05laLGoJo6DwnsfLLP
         2wsrbbX4p1ML38PGj3Fr3XtwI9wsMPW8WWGscWpZzhDa2dmLXes3aAc3p08T42Q9+cYu
         AVW6rF7uLvrzvXZEw93Dmc++l6QEeUrMzkHh6n099JUYIdRDmemkZGDGEbZIIHg7jdQV
         Zu8n2zBGFzbFs4vyOd73TIXA/Vct4Sj6W80ZyGX/fFkuJMxzNfcmgeO/tRjgux9ZeOFg
         8CoVxczLuy9guqHCJm82SkGxa9u0EcKb8/9Zd/+Yu7mCOE9+I/EUbHtJdmVakhEV/5Wl
         a8Tw==
X-Gm-Message-State: AOJu0Yxr3p2bkh0tb/9WNG9vNrQvnMJTUq50dpAZwO3T0FOmIOTJ37Tc
	6OSRaN5P9sOBwt6FtyUJl4WZPGL5xAxsF4WYOKM=
X-Google-Smtp-Source: AGHT+IGeouhye8hOkIIwNqntNBKkmAGudSvoanGUnWnqspWDkeYGSyKkEl4Uj8n81JKNTSDHCzJ6+dxOtU4FTHHDYw0=
X-Received: by 2002:a05:6402:12c1:b0:543:8498:fda5 with SMTP id
 k1-20020a05640212c100b005438498fda5mr2913662edx.14.1699790090541; Sun, 12 Nov
 2023 03:54:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <pinkflames.linux@gmail.com>
Date: Sun, 12 Nov 2023 13:54:34 +0200
Message-ID: <CAG+bWs3MJcKe15+5kO6qS4rji5pcVGbDDkkMgQThqcif+3t32A@mail.gmail.com>
Subject: Re: [PATCH v3] wifi: iwlwifi: fix system commands group ordering
To: emmanuel.grumbach@intel.com
Cc: bagasdotme@gmail.com, gregory.greenman@intel.com, 
	johannes@sipsolutions.net, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	miriam.rachel.korenblit@intel.com, pagadala.yesu.anjaneyulu@intel.com, 
	regressions@lists.linux.dev, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

I have tested the v3 patch and the stack trace is gone. Since I only
use the Bluetooth functionality, I can't test, if the Wi-Fi is
actually working.

Sorry in advance for any mistakes, I do not use e-mail or mailing lists.
