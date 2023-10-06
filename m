Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC0B2F58
	for <regressions@lists.linux.dev>; Fri,  6 Oct 2023 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5u9rYCR"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-690bf8fdd1aso1711774b3a.2
        for <regressions@lists.linux.dev>; Fri, 06 Oct 2023 05:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696594102; x=1697198902; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GhjdRY56jgRSIuP3aQcgGNFAel5n/yEYrUWn7j91LdY=;
        b=d5u9rYCRSCbSOuBAljEXXkHJtN/fSd6NTo4hEWKjn9Rpwv5KgFf+RrnkmYY/Zwp/dN
         F9oPG4caTJ31Ic1iPorCOsuUrm3rChuoha10gJqOU0IK7nBJ56ZLvWJfqfzq/3f9STC0
         rJj6IrdgoMn1+0FzwNANTpXALlcxVJ3w507JDYjfmpAj33h1gqfoh3CJYDziDo8r0RbU
         InkB2i7ovh49N1YpJF3fD9fkfLUPti2Xf6i42jLldUX9tevXqrDrnZpge1ZUOF67+U4U
         9+QelhFREZatsYBKPJlQxEVkPZESxePO7D3UXqrdpOW7ZVGdoJxUN3cZRIYL/Mg7Ccyz
         bx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696594102; x=1697198902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GhjdRY56jgRSIuP3aQcgGNFAel5n/yEYrUWn7j91LdY=;
        b=mHe60siHR5mcp55oVoTxVnI1sBd81m2sKC0gFC9coiUF+EmoycrOpkGF/KSb/CDKQE
         UljOwWunH57Ew9Ty8cXMGUGsq2PGob0uIALFc7t05tc7NA8EufI50kvXdyfa5pW3ivkn
         E/K+Y7b7U1/+2xgx/8T00j6hRkyWdPgrcrxE9BIBEk1OhN0xC/7Vr5/AM6KcSCt+GUTq
         JqhpjQbhRKaK+I/P15UiLxcNV22yyKsjST9nHXpAhrju9/9WKyJoWTgqUqqMfuI1S8Ag
         PZCT1bc2n0km5++bl+bj+rpn3+g1JKuKY3bLHvLMPaRRTBAgPN7qlXlKLuOK94dOl9rh
         IMSg==
X-Gm-Message-State: AOJu0YwDUWlRrtT89zd+YrIL2Iz9XmxkPh4JQ8XZOIdZ6DYckMvGd2JV
	vw7AMS6FlWLnHkgywQ/klTc=
X-Google-Smtp-Source: AGHT+IESL25NgxvA5K5j4FVoyq4yZiaAddmZox6puWn7+EyDgVvjaE4G2SaBXrdeVSWytJc5ZdbOEA==
X-Received: by 2002:a05:6a00:1355:b0:690:25fb:bac1 with SMTP id k21-20020a056a00135500b0069025fbbac1mr9101792pfu.18.1696594101635;
        Fri, 06 Oct 2023 05:08:21 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id y5-20020aa78545000000b0068e12e6954csm1307513pfn.36.2023.10.06.05.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 05:08:21 -0700 (PDT)
Message-ID: <982dc76d-0832-4c8a-a486-5e6a2f5fb49a@gmail.com>
Date: Fri, 6 Oct 2023 19:07:34 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Userland interface breaks due to hard HFSC_FSC
 requirement
To: Christian Theune <ct@flyingcircus.io>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: stable@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
References: <297D84E3-736E-4AB4-B825-264279E2043C@flyingcircus.io>
 <207a8e5d-5f2a-4b33-9fc1-86811ad9f48a@leemhuis.info>
 <879EA0B7-F334-4A17-92D5-166F627BEE6F@flyingcircus.io>
 <740b0d7e-c789-47b5-b419-377014a99f22@leemhuis.info>
 <BBEA77E4-D376-45CE-9A93-415F2E0703D7@flyingcircus.io>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <BBEA77E4-D376-45CE-9A93-415F2E0703D7@flyingcircus.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2023 17:51, Christian Theune wrote:
> Hi,
> 
> sorry, no I didn’t. I don’t have a testbed available right now to try this out quickly.
> 

Please don't top-post; reply inline with appropriate context instead.

You need to have testing system, unfortunately. It should mimic your
production setup as much as possible. Your organization may have one
already, but if not, you have to arrange for it.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

