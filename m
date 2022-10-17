Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8BDA20
	for <regressions@lists.linux.dev>; Mon, 17 Oct 2022 12:32:32 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id e129so10299151pgc.9
        for <regressions@lists.linux.dev>; Mon, 17 Oct 2022 05:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h0pxyt/EKUK/MG4h+DBekx3KlQE3mxmmFg/7fznhJTI=;
        b=SCgiftR9cblWOkQ3H14dm+Po7yBBMzZkgGcDfc2ct1IUJn4AG/PcN4+EoBcWuvW9RT
         v3wuTMwpMPePXxDhCCGzIxTRnj1y5rGaZm+stjLF+iMqVEGhaiWWg1w9urzqa3fRE5pA
         BjILXOXVc5wXPniPq1nmqlQhrJrR4lqDleBFBRR3yc2+onK0X7NWKC4M8I211Mm6DBSK
         zLQdgFiULDOrDRZ+gOg6SYK5/7/Woj0q6rx6D09ftCWoZr8HgWH+UkQsiTKeXIoBM6I1
         jaQudtyOQQBSZ5btGF525OGeHZODRC0Mtr+gvbeNV5m7kHRIituvzUy00qwpVfcwLVWm
         hfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0pxyt/EKUK/MG4h+DBekx3KlQE3mxmmFg/7fznhJTI=;
        b=dDnvlZbZJjnwK6eSXWJXY+MizDV4LFf3vzGZCgdg3pGUUCKXTQ1jdGIG+80dByHK0+
         91vAj7YPHZDQ7ZGKO+1Ul6sUeqKmeJYFbEqCMg1JvKWpuViD/tk1WWNIugLdaN+cmdl7
         vYC0RM0TavyFy514au4bhPWCwYEIPAKXFVILnZw/7gYW0pk1YLj6ovhT1YHxj0xpc6Uo
         6LcHkXtSK+9Btsh6vurB0OW0BArWcVHceeEdfkrAzVdPvQjvqlaaeVppwxWtTN0l/zT7
         P8fUkjtzb7uBsM62i+MWeoDDqWHBp8pDV1L76h7eYHxYPELfQZ2ko4aUT83SSQcV1d5x
         xsuw==
X-Gm-Message-State: ACrzQf03Wrzuw9unhh12Tgja6/vIcZdOwq4JLPRF/8EmqkheyauHs2GW
	3/Lv+w4V/fzpmSEWdVuAEnA=
X-Google-Smtp-Source: AMsMyM7HvJdx8QOn/eqVnmfTh5eLzM0viEj9FSk4U73Tb+3l+3qqzfm0PTXZan08EYGbWLP/Rk5ahg==
X-Received: by 2002:a62:cf81:0:b0:566:e88d:5006 with SMTP id b123-20020a62cf81000000b00566e88d5006mr7380101pfg.86.1666009951931;
        Mon, 17 Oct 2022 05:32:31 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-13.three.co.id. [180.214.233.13])
        by smtp.gmail.com with ESMTPSA id r8-20020aa79628000000b0056699fcdf6bsm6158979pfg.84.2022.10.17.05.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 05:32:31 -0700 (PDT)
Message-ID: <a1d46bd2-9603-f89a-ec85-ebcd25db8882@gmail.com>
Date: Mon, 17 Oct 2022 19:32:25 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>, regressions@leemhuis.info,
 mirsad.todorovac@alu.unizg.hr
Cc: linux-kernel@vger.kernel.org, marcmiltenberger@gmail.com,
 regressions@lists.linux.dev, srw@sladewatkins.net
References: <8702a833-e66c-e63a-bfc8-1007174c5b3d@leemhuis.info>
 <20221015205936.5735-1-phillip@squashfs.org.uk>
 <2d1ca80c-1023-9821-f401-43cff34cca86@gmail.com>
 <c5980bcb-f345-ff2e-a29b-75e53a6b8708@gmail.com>
Content-Language: en-US
In-Reply-To: <c5980bcb-f345-ff2e-a29b-75e53a6b8708@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/22 16:45, Bagas Sanjaya wrote:
> On 10/16/22 19:21, Bagas Sanjaya wrote:
>>
>> No Verneed warnings so far. However, I need to test for a longer time
>> (a day) to check if any warnings are reported.
>>
> 
> The regression still occurs with this patch applied. Let's see if
> reverting the offending commit helps.
> 
Sorry for speaking late about my triggering cause.

As the background, on my Debian 11 computer, I have lxd snap installed.
I use lxd to channel my sysadmin side by spinning up containers and
installing server applications there (LAMP, email, DNS).

Back to triggering cause. I can trigger the regression when the network
connection drops (when Firefox shows connection problem page). Then
I run `lxd list` to list container instances and I get the Verneed
regression error.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

