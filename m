Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B6D52F79
	for <regressions@lists.linux.dev>; Fri, 19 Jan 2024 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705671249; cv=none; b=b75MKrVnsJQp/1FxiYsWcj3WoCEFoeJ8ibHwQ21jq1RxSdbqKZcZcM46MpmYugxdoRd+r0gAO/XXXnuYIFe9ThAOpwI4/U3Xga7Nvcf9ID8heIbLuNy80XDlA5xoCG136+yFRG8yyUtXaI5pScsOENNVp8iPtKE4G+uIc1m6xy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705671249; c=relaxed/simple;
	bh=UBsHDqO8tKLqiQ+CTMYG+UCcxV5ppDhinAhgrXTQroQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVzmIN2k+E6phiyyzflazYUGmvc5ddRI3YoLBlLlF15XMEr1z5y57PaRxZGK1yXw8mE0GPgOrA+jyFZpl02Tlvenzo5Y2t6XGYILFLgEMIqTqYZ44Ppcizi3iZSw7blTGuzCWJxIbaySK1lSsvfht+x+SzOsp+V8OF94lbKq+qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFl9dtdD; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFl9dtdD"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5cfa71498feso694493a12.1
        for <regressions@lists.linux.dev>; Fri, 19 Jan 2024 05:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705671247; x=1706276047; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IEtuowdYcENMHjoePZzsx4gwz942S9hCHH4g6ErNp7g=;
        b=cFl9dtdDRO/NfvYDYB9VChltk/RpSvA9FzRF360JOy0BijF/ki18Oah80PV4TdSft1
         ULC6LFXoMQYOFyYuprwKDY839eqyTMDAckU6qQ3kOLfUTwwW7hiDx9nxy08SPuAyB+W+
         Ag+nopSjNwNXlBAJAxVuk5iOxi6tdVX7r5YEI5e1NcDfPADTkQUrcFZ23rRry+h5tsM/
         domyHpxjBBwjJpCuwutCmyhAbe1cyvjgR5a2PEdun6fD7HXogDxtAHknJ7CqDWxgb/Ek
         G6bpO0FPB81i1Fq95kvHd6PgU2nFQY8sigUzmFgTHUi6mswct6Q/ST/P3XodwtOW0kNj
         dBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705671247; x=1706276047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEtuowdYcENMHjoePZzsx4gwz942S9hCHH4g6ErNp7g=;
        b=ULMQ1zISD1EFkMbznmN1NBR7t6SdPe+yJPzgzAby2rA/GdMlvzWSTRHfSMorCLbapk
         q6q0y0w3F8GBJKF3RJNjmrfNxUSqhufsGkJXxMVQDauz1XxYvBV7/obrM9ka5pYWx6Nr
         Qm19SX4GjliMHQEM8JWPN4mhM23MxAmaVAjNditE45Wi5Q9qgadNcGihBbtniFSoQHbH
         bTTR+aE2/MP2dBrVb7riwb3P6XrTO/zX32uVYgQ1vwUiH3icPpNWKeCeFUvJP/3GrLbE
         NTXGco0r7Q3nPeMnxh12nKtKSbhHbHwJNaojmb2IklQCoiL2HoJ+e/lM3VQ+TU+pbfDC
         sZjg==
X-Gm-Message-State: AOJu0Ywau3ou+9Rphs2nC4FkjovZNtzxP00L5ukxJ5f+VAiz+TinR7vy
	+X/hxgnmssFpFyjV2J2efBn0wJ1gkWdOKllsQ9zJc96oVzLGyH48HVilqsVC3MM=
X-Google-Smtp-Source: AGHT+IGAFLo9KRH9q9uNiFVsZuGA+bSjfWZPxWv+9VoYLrjeP72T0YBjj29Ii48OuvZrH22M0zGI1Q==
X-Received: by 2002:a17:90a:6d43:b0:290:4e69:6a2 with SMTP id z61-20020a17090a6d4300b002904e6906a2mr606173pjj.82.1705671247143;
        Fri, 19 Jan 2024 05:34:07 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id v20-20020a170902d09400b001d70602f561sm2867025plv.1.2024.01.19.05.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 05:34:06 -0800 (PST)
Message-ID: <48691b8d-1710-431d-ae8d-398ba1482de1@gmail.com>
Date: Fri, 19 Jan 2024 20:34:01 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Disk write deterioration in 5.x kernel
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Gowtham <trgowtham123@gmail.com>, Linux btrfs <linux-btrfs@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>
References: <CA+XNQ=j6re4bhRDUebzPLDvMtZecqtx+GRRPgpd9apss+vOaBg@mail.gmail.com>
 <CA+XNQ=hGxYsMAo6Gc+Up5QctbWjkER17uK97YXWc9uyx_7+3uw@mail.gmail.com>
 <ZaodrO8QjCqSXPHe@archie.me>
 <02c0a0c9-91b7-4766-9c15-8059b8e7c09d@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <02c0a0c9-91b7-4766-9c15-8059b8e7c09d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/19/24 15:55, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 19.01.24 07:58, Bagas Sanjaya wrote:
>> [also Cc: btrfs maintainers]
>>
>> On Fri, Jan 19, 2024 at 09:37:50AM +0530, Gowtham wrote:
>>>
>>> Is there anything I can collect to debug what is the problem in the new kernel?
> 
> From the version numbers you provided it seems you are using vendor
> kernels containing patches. You thus might want to ask the vendor for
> support. Most upstream developers are unlikely to help and some even
> complete ignore reports using such kernels.
> 
> You also need to try latest mainline and bisect, as Bagas already
> pointed out, as that problem might be solved already and might have
> nothing to do with Btrfs at all.
> 
>> Please don't top-post, reply inline with appropriate context instead.
> 
> Bagas, FWIW, I think telling users this is not helpful at all and maybe
> counter productive; please consider to stop doing this.
> 

I was writing the reminder like broonie did.

> Yes, kernel development uses inline replies -- hence it's a good idea to
> point that out *to developers* that submit patches et. al.
> 
> But most people in the world uses top-posting; you and I might not like
> that, but that's how it is. Telling non-developers to adjust their
> behavior to our habits will often just come over as rude. It might
> nevertheless be worth it. But it's best to leave that decision to the
> developers that handle the report, as they have to interact way more
> with the reporter that you or I will have to.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

