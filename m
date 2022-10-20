Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906716110
	for <regressions@lists.linux.dev>; Thu, 20 Oct 2022 23:23:24 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id bh13so956741pgb.4
        for <regressions@lists.linux.dev>; Thu, 20 Oct 2022 16:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CE6evqtIX+07t9cXGQPGwOH1py4DcBmEiVntfTOE+UA=;
        b=DsYLC1odzvMybDOKm2hjUoY7g7UyfNQ9/CdHy1fupzg7ZV1mL78dpgznLgl5cEGy/1
         Luw4PGzTeGt54qhMOgg1z6CIBjQRmKSe5SQcETMiCH6pb9slYyicgODC2ZJri1ABEagg
         oiHmHrKwX/KamQtgITQVNGtoHIXfRtPqc5vBT0sqbC3rFF3ly++0dvKVweATlMftUf0T
         P7OeZn8SLxTsYltgV6ohukrXbxFD7Rky8jZ4Js3tHWARiOA54uDO4yVEfAgr5cXUPaTZ
         XXB7TQ/vaX2Tldv+2t1rHn881zREeW9LdbFgI2jLosEG5CpDg1d6DNEjwwT3lHVfz8Em
         FI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CE6evqtIX+07t9cXGQPGwOH1py4DcBmEiVntfTOE+UA=;
        b=uMOGEDoylAiU/IHp37AD/fPGBzWYuMHbjA2nRtoWFSjMny2aTAGaHziDbBRSgAW+zU
         uLAFBhh9V5Jbgc86RN44KR5C9wHXuK36I5pERNBfVemC1ocKRy+VMMaEwCHgKfyNs/Zw
         ltma96FufRnx1sPHO9EKHt0qa31pldBzYmy2MdmIh2tFDZu0WTd0qJXBxca31zILfx5H
         nZOuy6RYZLA8r0G+GHzKMvPfaK7dVrjhCkcc2WMHMN4spTzEVTpYNC76pp8Xj+6dPXkZ
         b1bk1+vPGFCJfudimzsGVMR94Q9c/p6FaGvnWkk96vntQRqJ0KNXC4RC9mePNjhvWROf
         Gzww==
X-Gm-Message-State: ACrzQf0GAL/wuoONPN9nyM1wmHgsgb6lIdg7ThvcgUHXJfxgoRzxLcKp
	hfNOf6uncyFKDEyIN0Hy7VM=
X-Google-Smtp-Source: AMsMyM6SYRWDFAek8ZuBOMLzRnxVB7h7msJN8vNg0BbbLcyfagcKQhlV8lFGFt67DZf72OZkvjwlWA==
X-Received: by 2002:a63:fc12:0:b0:45f:a6e3:7559 with SMTP id j18-20020a63fc12000000b0045fa6e37559mr13797009pgi.237.1666308203894;
        Thu, 20 Oct 2022 16:23:23 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-32.three.co.id. [116.206.12.32])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c20c00b001750361f430sm13341444pll.155.2022.10.20.16.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 16:23:23 -0700 (PDT)
Message-ID: <02b72b86-7240-5530-477a-c8bdcfd35ef5@gmail.com>
Date: Fri, 21 Oct 2022 06:23:19 +0700
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
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Jintao Yin <nicememory@gmail.com>
Cc: hsinyi@chromium.org, linux-kernel@vger.kernel.org,
 marcmiltenberger@gmail.com, mirsad.todorovac@alu.unizg.hr,
 regressions@leemhuis.info, regressions@lists.linux.dev, srw@sladewatkins.net
References: <20221018174157.1897-1-phillip@squashfs.org.uk>
 <20221020135545.586-1-nicememory@gmail.com>
 <41ef4b22-eea8-2d67-99d8-6aaae7d25ac1@squashfs.org.uk>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <41ef4b22-eea8-2d67-99d8-6aaae7d25ac1@squashfs.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/20/22 22:45, Phillip Lougher wrote:
> On 20/10/2022 14:55, Jintao Yin wrote:
>> Hi all,
>>
>> After review the details of page actor, the tail bytes may be written to
>> a temp buffer instead the last used page. So before diff would wrongly
>> memzero a page which is not the tail bytes in.
>>
>> In this diff fixes it by caculation of the real index the trailing bytes
>> in and check if the last used page matches this index. If the page is
>> the real tail bytes in, then memzero the trailing bypte of the page.
>>
>> Please help test and any feedbacks are welcome.
>>
>> Thanks,
> 
> This is a rediculously complex patch.  Sorry, but, absolute NACK.
> 
> Additionally, it is poor etiquette and pointless to fix an
> already fixed issue with a _more_ complex patch.
> 

Ah! I was about to test his third fixup patch. I prefer to go
with your fix instead (as the formal patch).

-- 
An old man doll... just what I always wanted! - Clara

