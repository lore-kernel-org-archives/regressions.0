Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F17156C7
	for <regressions@lists.linux.dev>; Fri, 30 Jun 2023 13:41:07 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b7e66ff65fso14358225ad.0
        for <regressions@lists.linux.dev>; Fri, 30 Jun 2023 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688132467; x=1690724467;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2cSj7+SKvm+HZljgLkJO28h0UXat1DVlQlcLXRYXznU=;
        b=IM5xCfohhl9OGJ/43JvqfZYAOJZj557C2PV+Tc6CNEyJsNfzm50Yx+ev3eywYeLiY3
         Zb0GcF/Vn/UNZZKBO/iwoXhx8i4VB3gHZK6rhS5KyzKuxJn8Apui5mqHSqVWeuBEVjoA
         UgxVTrFYO12KbVK3TeOg1RdAA+yGz5jFtt73BzFzyqJj/pK/c3lXmboYpouqJeb5QQRE
         BAW5oKdpo+zmxLV+OKOm2GIvSiYVC5bakQl6tPsUklcJ5ZZsJ3r0lvjMGlOprIyrdHVs
         VfETTSHovJu7CLjwd5Gi2KAGEJYcq+5s2Y2/zqmA4GT90tktw712Nlv4rdqlT+wW4EEj
         3z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688132467; x=1690724467;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2cSj7+SKvm+HZljgLkJO28h0UXat1DVlQlcLXRYXznU=;
        b=fzl+zjqAKD3hDmYJimPF+lul7pbbw7IBTmS04pza0+4e2A07rAD8ERw4qyRYPhCT0y
         cscDW7OdlQadvN6aiFhiHncKOLVbYPGIavSLMsycjC8xSDTKoEbIE+X3mpeXF6g9KCr1
         ojib0P+xAJbL2DgYo3Zpp4ygL1TW3XFcxY++HNdGhpw4Aov4eAAcGxgD1EDAgu7sR53x
         BMfBBFWKmddb67VmAcTq/dONaPDJhSSH8pm5Fl+Tv20AC66vJ6FVllS7EnFlnhSss92b
         mMvdjlb+k6tOMw17NHgJjo7p51RCU63OqUPldL9G/fd7wsUl2O4ZAN65sP+Dy6Zu6p9r
         7Lgg==
X-Gm-Message-State: ABy/qLavZLWF5pWa6CaH636V+q6BESa28RrDUwW0AYenbHNqW3qInPau
	tQE2jCAncU/TQyKIQ66ggRQ=
X-Google-Smtp-Source: APBJJlHuQbk+hl+6iWEGzWpfagLwCwm7KfSDo8plHj2dz2Dzs5nCEnf4gPOstgpbpFiPrVg+mgpLBQ==
X-Received: by 2002:a17:903:22c7:b0:1b6:6985:ff8d with SMTP id y7-20020a17090322c700b001b66985ff8dmr2526298plg.42.1688132466949;
        Fri, 30 Jun 2023 06:41:06 -0700 (PDT)
Received: from [192.168.0.103] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902ab8700b001b03f208323sm10822168plr.64.2023.06.30.06.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 06:41:06 -0700 (PDT)
Message-ID: <d5e0c840-f4ea-d44f-803c-fe97c481759b@gmail.com>
Date: Fri, 30 Jun 2023 20:40:57 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Bug Report with kernel 6.3.5
Content-Language: en-US
To: Martin Zaharinov <micron10@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Eric Dumazet <edumazet@google.com>,
 Linux Regressions <regressions@lists.linux.dev>
References: <20F611B6-2C76-4BD3-852D-8828D27F88EC@gmail.com>
 <ZHwkQcouxweYYhTX@debian.me> <ZJ1rC8WieLkJLHFl@debian.me>
 <F8555BEF-15B3-4CFF-8156-D5B1D6C24736@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <F8555BEF-15B3-4CFF-8156-D5B1D6C24736@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/23 19:42, Martin Zaharinov wrote:
> Hi Bagas,
> 
> Close for now , if i collect new info will update here .
> 

I repeat from my previous email:

Can you clearly describe your regression? And your nginx setup? And most
importantly, can you please bisect between v6.2 and v6.3 to find the
culprit? Can you also check the mainline?

Sorry if I have to cut down the context because you top-posted.
I didn't know what context you were referring to in that case.

Bye!

-- 
An old man doll... just what I always wanted! - Clara

