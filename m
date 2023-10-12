Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B56FC13
	for <regressions@lists.linux.dev>; Thu, 12 Oct 2023 09:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAiKXq4+"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-690d2441b95so558338b3a.1
        for <regressions@lists.linux.dev>; Thu, 12 Oct 2023 02:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697103468; x=1697708268; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdZgfymsyd7ehqcxRdjpYNBTpQVaXLUbV7TLN4E1/DA=;
        b=eAiKXq4+TS/nrgVZ79WB37KJuxG3MtNAwAnz7cm0q5u+EK4Jno7OtUIaNPhfFjO32i
         kLlwuHWvNr76C+epS7Ap2a9Mt8ER0tCFNofyGECH788RsAQZyfi/KtmUmhYrCsyjYOfH
         pYzyfkMxbjfeKK9usFl5dADJdzRVBSI63otn4DimXUknyqkbT0jeGgNPmWFlwKG6U1YB
         9FLv3GrPua/ZkMGS89NcMlr7JG7OyxrlBFEGNE84Vr63+W3As22MQiWhJSzkCCZz1FuQ
         c7XqgciLxL1PdaF3a/cjL7SXwsC/Ow3V+Pm7E/80z+Jl2xBF0nfhZlS+3U/XVf+QLCj0
         78GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697103468; x=1697708268;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fdZgfymsyd7ehqcxRdjpYNBTpQVaXLUbV7TLN4E1/DA=;
        b=U0RfqoAwd84kwulw/U/DZvh97UaENGE/WEaUHNNJsGXby9mDR5qydrwYrKOLvGd3Oo
         i53owf7METn4lsgp1X1OLDfvzjOpHsAlwDmtQY9tnxt1705/sTQZwWP2g0UQkzTZhQwF
         WJ2ucsCqdipIJWSFg8JeXoYS0t6C90hq/Oi2XtG2l7Sauc6zRWTBFMk71CC7d/pXGH/0
         spIBD3hQ+VAtp0mozXxtYib+uFaMtHwTEfDSgwg1JM/KtEO2mp9ISABYBW/Eg0MJ5w02
         56pwtVcz9FWWhghobQOMUN9LW3owagT/5HFKDhdGgnIi8gLpyJF0bx+Jl/XlO+wYboce
         nKWQ==
X-Gm-Message-State: AOJu0YxyAudYXQBRMXwzfpt5wo1FvyleWfhvvj5h4JXqy45PTrNL2nss
	+CYuf+Axgg0usBiA6J8DtaU=
X-Google-Smtp-Source: AGHT+IFtx9yabPtRA17h06vlo13OrJKoThnA6kM+dAvk+E82XxXruxxbs4KeGiTVxMXiCnkNk0pDTQ==
X-Received: by 2002:a05:6a00:1595:b0:68f:cb69:8e66 with SMTP id u21-20020a056a00159500b0068fcb698e66mr31525387pfk.15.1697103468109;
        Thu, 12 Oct 2023 02:37:48 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id x15-20020aa7918f000000b00690dbab1623sm11371659pfa.81.2023.10.12.02.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 02:37:47 -0700 (PDT)
Message-ID: <e6d1dae8-e28a-455a-a851-661c825fbdcf@gmail.com>
Date: Thu, 12 Oct 2023 16:37:42 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Yanjun Yang <yangyj.ee@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Kernel 6.5 hangs on shutdown
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> I use Dell OptiPlex 7050, and kernel hangs when shutting down the computer. 
> Similar symptom has been reported on some forums, and all of them are using
> Dell computers:
> https://bbs.archlinux.org/viewtopic.php?pid=2124429
> https://www.reddit.com/r/openSUSE/comments/16qq99b/tumbleweed_shutdown_did_not_finish_completely/
> https://forum.artixlinux.org/index.php/topic,5997.0.html
> 
> Tested with various kernel and this bug seems to be caused by commit: 88afbb21d4b36fee6acaa167641f9f0fc122f01b.

See Bugzilla for the full thread.

Anyway, I'm adding this regression to be tracked by regzbot:

#regzbot introduced: 88afbb21d4b36f https://bugzilla.kernel.org/show_bug.cgi?id=217995
#regzbot title: x86 core fix pull causes shutdown hang on Dell OptiPlex 7050
#regzbot link: https://bbs.archlinux.org/viewtopic.php?pid=2124429
#regzbot link: https://www.reddit.com/r/openSUSE/comments/16qq99b/tumbleweed_shutdown_did_not_finish_completely/
#regzbot link: https://forum.artixlinux.org/index.php/topic,5997.0.html

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217995

-- 
An old man doll... just what I always wanted! - Clara
