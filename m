Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBFA36E
	for <regressions@lists.linux.dev>; Tue,  7 Mar 2023 02:58:03 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id ky4so12707725plb.3
        for <regressions@lists.linux.dev>; Mon, 06 Mar 2023 18:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678157882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZG9H8kJCK6WYwRPdpe8Xhn57MezozsZ/GiZoddNadUo=;
        b=eMu1WXHDVsaEZqx58s0fbo89SuPSweqXF8VArjA18ypdz+WK9HYC+qeF01v/VxFutq
         40G7EQfVkrArxG0lYsdVq1+aeyZVCPtLQOleYt6NTfyyn2dWauL94rXf81rTGrPhw00P
         5MWx3n8KYTGt7mH7qy3TeYpY3GEIJ9x81ycdsa/xxyedyakrtZLne71q8FwxN5iuEvne
         cM/epRuPbomeYnz/6yhSOX2ghgT656w13Uu0P/chhlWqj8BOuZYdQzMQzodXi1P9IGw+
         qukbRip9ScaZQWpQMluK6pMZai20XhyAg9QWHaXSTPBOLG0lmVP/XNFWWDwfRN1dCxaV
         FgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678157882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZG9H8kJCK6WYwRPdpe8Xhn57MezozsZ/GiZoddNadUo=;
        b=8DpxcS1kCjKzdDH9mmrWOXWbqhy7ReDotBy96sUUWr+QvwLCjRgQDUhgCFGAMO3lNT
         B3IwNjIL/A/39doNdlJPWuXkPH7cDnCNTSU/jlJqPzfJkBKBqwCQ2QbnXAEBBCaByhtj
         zw5QDnuAjk7Mu1UjEZ9YNVr+Bt08U3bprlRxxUwGyDZW/8pR1unFo3YPAOD/iqtpDSPj
         iVp6iTY0wComBOAMmFzfFfGYnBKo/oUHbArO2puOrbd5aX0R4Hy1Z9cXJpKvtGujwszl
         vf83wsxho7VdqdohUsTM07BSgWFWqoZLApUBeVTUauoDRuvLtYukLl30U5eJZysGujR3
         ZOVg==
X-Gm-Message-State: AO0yUKVBf1x8p+4ihKi0wmSjGZmHAgW6ExRwZHpfYSL7eUI9WMSLFzXS
	m4SX/c5C0rTbQl9Ytc6jBls=
X-Google-Smtp-Source: AK7set8sebQi6ka4Uw0tIudv7vur/G+YowtMa7d1No3GHx7jRxgAdVzieGfTZ3qknMwreU/Tot+KJg==
X-Received: by 2002:a05:6a20:a025:b0:cd:9db3:a7c1 with SMTP id p37-20020a056a20a02500b000cd9db3a7c1mr11838174pzj.44.1678157882389;
        Mon, 06 Mar 2023 18:58:02 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-68.three.co.id. [180.214.232.68])
        by smtp.gmail.com with ESMTPSA id x6-20020aa793a6000000b005a8dd86018dsm6971769pff.64.2023.03.06.18.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 18:58:02 -0800 (PST)
Message-ID: <2d1362fd-c109-1d8f-5954-3d60475ed907@gmail.com>
Date: Tue, 7 Mar 2023 09:57:57 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] docs: describe how to quickly build a trimmed kernel
To: Thorsten Leemhuis <linux@leemhuis.info>, Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <1a788a8e7ba8a2063df08668f565efa832016032.1678021408.git.linux@leemhuis.info>
 <ZAVp6jdeWzYcisUO@debian.me>
 <3d6a30ee-f093-f5b6-a193-cd86320f9452@leemhuis.info>
 <f53f84b5-9da7-0726-2e1f-f7e81e8ecd24@gmail.com>
 <b12d433e-62ea-3ac4-dd97-be0288f1335f@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <b12d433e-62ea-3ac4-dd97-be0288f1335f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/6/23 16:07, Thorsten Leemhuis wrote:
>> I think it depends whether someone would pick from /proc/config.gz or
>> /boot/config. My kernel configuration have CONFIG_IKCONFIG=y but I
>> often copy the config from the latter instead, since I booted with
>> arbitrary kernel version when compiling two or three versions, and I
>> want to ensure that the config used is from correct version (i.e.
>> I use /boot/config-5.15.x-string to build 5.15.x+1 kernel).
> 
> Well, I'd say for most users the file that was automatically picked up
> by olddefconfig/localmodconfig will be the right one. And for cases like
> yours there is already this in the text:
> 
> ```
> The make targets try to find the configuration for your running kernel
> automatically, but might choose poorly. A line like ‘# using defaults
> found in /boot/config-6.0.7-250.fc36.x86_64’ or ‘using config:
> ‘/boot/config-6.0.7-250.fc36.x86_64’ tells you which file they picked.
> If that is not the intended one, simply store it as ‘~/linux/.config’
> before using these make targets.
> ```
> 

Ah, I don't see that feature! Thanks anyway.

-- 
An old man doll... just what I always wanted! - Clara

