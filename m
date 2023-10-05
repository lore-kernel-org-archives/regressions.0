Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A5421105
	for <regressions@lists.linux.dev>; Thu,  5 Oct 2023 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhQw+IVD"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-690fe10b6a4so834366b3a.3
        for <regressions@lists.linux.dev>; Thu, 05 Oct 2023 07:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696515275; x=1697120075; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JRX3/Gt3srv/e7AHO8IUFPoIUo5JbeHrDyopAPxYQfg=;
        b=HhQw+IVDINsMgDaxtcRib4bcKuCRBVbrBBgOnEGutmP1PQJhKh163PlCJHhlg6S/Zf
         nex+PuX+qZn98d8M5HshGVKdMpOnecZJ32GjokF+ZtBEbfAKpL++dAFopLU149dP1heP
         208M+1+DvsdWUB/ZBmIuuyE+FjOw+S7QM9otlkKuhj7Q5a71SMs4w386KrBGoviAHlg8
         EMi//mde/n9oXzazCT9oMH+XOUfNSNpkWEM3HOgxiTCZBTrN/x6x04Fcb8dIEEqYc9Ss
         Z77CGFco5LAfaviGU+pYsbl/pCA71KPmdM/OUCesPyNX9y8yfHvNlTTMWr3KtXq3EBP3
         1uIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696515275; x=1697120075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JRX3/Gt3srv/e7AHO8IUFPoIUo5JbeHrDyopAPxYQfg=;
        b=jeXQ5eHLw9ik9fkBk/9qDokSd8oJgvuJP2i8PlRe0MQJuwJKpDH+RqMdhJp4bak5rL
         oyDOuo9VT5PVxytPfO8La9ZWxEpBmqL/+sM8FN9F395BBcD6UH7H2/BtWJSmNhEFhNq/
         pj/gtqBmX6LEzy4zewp7tqHmPNpgTATXuleZKSYzHAxB4QAFQLEPavWUKUgJclkvVhCQ
         g9fzk692cYE0U8YCIaPvatUue/HjiN44+Aw6+Hs8QPLghRFZ8l5xGbBCbLHHpb+IAEa9
         LlOeW1gaqgr3h7YgGHcQBvy5ndG5D8v/QMGZhPdmj2iE0hV2xMALU2X7JHcePGQ4zsot
         bTSw==
X-Gm-Message-State: AOJu0YxpnVP4btFe3rhMKuL8sopZ+0h4QDAngZ2nOnufbkMOEyYkEM73
	UiV6sPsKXi6AVeuTLek7pDjEqCNIoLE=
X-Google-Smtp-Source: AGHT+IEeRx+XgfA3+fP3kfww/bCY0zMNHEVM8tRFijHwPIggIPn9wkl6mwbyfwRVRyHDGBW6QDgYwg==
X-Received: by 2002:a05:6a20:1a9d:b0:158:17e6:7a6 with SMTP id ci29-20020a056a201a9d00b0015817e607a6mr4517939pzb.42.1696515275091;
        Thu, 05 Oct 2023 07:14:35 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id w18-20020aa78592000000b0064f76992905sm1392751pfn.202.2023.10.05.07.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 07:14:34 -0700 (PDT)
Message-ID: <20cb9f71-cb69-4e8a-b2c5-566292c802f2@gmail.com>
Date: Thu, 5 Oct 2023 21:14:29 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: kmalloc memory leak over time.
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Kees Cook <keescook@chromium.org>, Daniel Micay <danielmicay@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, freeze0985@gmail.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <4f01f302-9d59-4146-b7ff-0478c4bd94b1@gmail.com>
 <8343dcf3-96e9-4601-aaac-e0a80686586b@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <8343dcf3-96e9-4601-aaac-e0a80686586b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/09/2023 19:55, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 28.09.23 10:40, Bagas Sanjaya wrote:
>>
>> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
> @mm developers: feel free to ignore this, the user has Nvidia's driver
> loaded (see bugzilla; I'll ask to reproduce without it).
> 

#regzbot invalid: reinstalling nvidia driver solves the regression

-- 
An old man doll... just what I always wanted! - Clara

