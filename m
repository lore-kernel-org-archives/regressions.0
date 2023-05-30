Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431A719931
	for <regressions@lists.linux.dev>; Tue, 30 May 2023 12:41:40 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-64d57cd373fso3806030b3a.1
        for <regressions@lists.linux.dev>; Tue, 30 May 2023 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685450500; x=1688042500;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcpB52c/UtNvFZJAngMvWnMhtf2U/fgcu67BgG5nIYU=;
        b=ak2kwL1WfIK6rbLQVx8LyRPHqpOyh++Aw6IRctrHkgD6I/fgYEGZqRxTvhwMs+u2Bj
         H4nHuhQc2x5QG2QWSdqcIw+4otST3+PPvEFMzd+QEvFyLO33r087r3dZZLS4UUepEKug
         AecZDh/GLWGZEANN5Pk1veWI4Jam+RDSlWM8O6y3dIDvqg9vQsWgpz4vOsmJa2YYyTV4
         q01pEGTX4Ei3y7kYLAYVB1/KgGTU402wbzh3oHMmuZa9pBxwS/aRbUEA1PIAVSmoa6B0
         iXuzKGMYvve2mw9yxRmcP4d+gn1aYLEY8bMhMnt79Ix5gowczow5NBR3A49oSkPZ47nN
         jrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685450500; x=1688042500;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OcpB52c/UtNvFZJAngMvWnMhtf2U/fgcu67BgG5nIYU=;
        b=PdaHwLH8Uqc98AAoKXLuauMsgle+46D8FYssn8IwLw0rf5p1dc640+6U0OXVX3nOmr
         PUQLGCihgG3W2rBklM3d+rvnNnqfF//WyDTKflflHnqHcQv4779QRJLJ8YmYmN6erBOA
         HYmvQsTXn1y1Q2mDVlpqmpSJFP+zReeAmEX46oZF1yLhg/fnWtWVIQ2a7IQ0UTA3RoNY
         ueCnWlIg4REot6Ir2pTov+YVRvJsvtCmPDohW1CcSEPbsNSP88oclHyoFSYhR0SgAvyZ
         VgCTYyvmD24JxayPdyEE7C0LWDJw7U8x4KSVL6be0k9tJs2yMcTqoXILaAYeiFwczCp3
         JvkA==
X-Gm-Message-State: AC+VfDxsqr9GEECeuIeY3fqYHm9izUN0DkABv4iS+/PvWleBd8gEWMWZ
	rUt0KGuZbcLnaMwhI9c6EUS4eDfYgV4=
X-Google-Smtp-Source: ACHHUZ4hOUep/dS5YqlmauRgyXZ+kx76jLICMS8jSzjIekHzB6snZ7G64dbSii0o5Ple4ZrSIk2bYA==
X-Received: by 2002:a17:903:1111:b0:1ac:820e:c34a with SMTP id n17-20020a170903111100b001ac820ec34amr11046997plh.0.1685450499604;
        Tue, 30 May 2023 05:41:39 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-12.three.co.id. [180.214.232.12])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902dac300b001b0499bee11sm3438873plx.240.2023.05.30.05.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 05:41:39 -0700 (PDT)
Message-ID: <cf4f50bf-99ca-f94f-f0cf-63081d531b4c@gmail.com>
Date: Tue, 30 May 2023 19:41:36 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 Linus Torvalds <torvalds@linux-foundation.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: regzbot dashboard stalled (no regressions reported generated for
 v6.4-rc4)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Regressions list on regzbot dashboard [1] seems stalled. It was
last compiled on last Sunday (2023-05-28 06:18:57 (UTC)). Is regzbot
not running, and why?

Thanks.

[1]: https://linux-regtracking.leemhuis.info/regzbot/mainline/

-- 
An old man doll... just what I always wanted! - Clara
