Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E807848C
	for <regressions@lists.linux.dev>; Tue, 25 Jul 2023 05:53:45 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-666eb03457cso2870805b3a.1
        for <regressions@lists.linux.dev>; Mon, 24 Jul 2023 22:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690264424; x=1690869224;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7S+2aJSoBjeMVJrCzXjHRFtcR7Wfeu3VZj7Bqt42VI=;
        b=GbFG7x+C8dFgsdUUcmRmrzp0DtjCn9WTfPdErIgb8DFeVZQAPPoRuqD/9ONNxCuMfS
         y+y8bos3rSDFYYgwun/pNW0F0CC8KSXGhAjEapZT8Quwa6BHL7hDHSW/DcP6kl7HbgUA
         rB94bw3sSpdDk1piua79zbMCxw4OVsLzRxaOBZpYrx08fE/3YA4i195d9hv+ZFdYWQ8e
         0H4s1qEruQvLvf0Cr4t5RGNuOdUzzME1BKW8RXVEYkF4bTuB7h8CwnNIUKgHFs0Waqr8
         UVT7aKCsW/pkTlB0XNqgAaxL4J00Nghkhv6F9Cw0naOGP99aNN60E+AYCRORK8YWVY0a
         JtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690264424; x=1690869224;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7S+2aJSoBjeMVJrCzXjHRFtcR7Wfeu3VZj7Bqt42VI=;
        b=Nbg4IreGxRTMFpot5oU0JAyrX8OAu6aPPkFvlG1gd5hd7Vl621CshEIHliY3nIrPsU
         7GkuLY+qCllPuxAdz6CUATlTbcapHO250tE2Rlo5DbFtrpCArIJqhmfZAJqH4CwSRSAq
         M3uItNMCrpVFGCMeE9BRHzihkIM591D+sDox8Ko9oOXT/QQZwF2ADZnIS2Bka9BHCAyp
         9/BlhK5qMCzMG/orirMGheBaGQcl6/GPNb+lWiZ2DWt63JUZeVpux81chdkNJHndMbd7
         R4oPz4GHWJOip4uQhKIXOz1/wPhBhU791iJGGVr9duktPmeMcZKCv8H2h4qimu7i8L+q
         uU0Q==
X-Gm-Message-State: ABy/qLa0/XnImYRl8HSsVky19WywhDPqI3jh3yyCRhCMEARgzpb6al1d
	lFzJ2MJPGrAbI8F+AInkfj0=
X-Google-Smtp-Source: APBJJlGqutAEygo9+NWsVTICuXatmhcaOec39ta6l6gzqeHsUNjWONldt6u4DK3Z8FyNf5UT5mRbpg==
X-Received: by 2002:a05:6a00:150e:b0:686:6d87:1cd with SMTP id q14-20020a056a00150e00b006866d8701cdmr8304652pfu.5.1690264424466;
        Mon, 24 Jul 2023 22:53:44 -0700 (PDT)
Received: from [192.168.0.104] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id b30-20020a63715e000000b0056393238571sm6360084pgn.50.2023.07.24.22.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 22:53:43 -0700 (PDT)
Message-ID: <04a714d0-ceab-6287-c9fa-2450284d1caf@gmail.com>
Date: Tue, 25 Jul 2023 12:53:38 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Fwd: Kernel 6.4.4 breaks Elan Touchpad 1206
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Henrik Rydberg <rydberg@bitmath.org>,
 Verot <verot.wrongdoer713@simplelogin.com>
Cc: Linux Input Devices <linux-input@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Stable <stable@vger.kernel.org>
References: <42bc8e02-5ee0-f1c8-610e-e16391e54ee2@gmail.com>
In-Reply-To: <42bc8e02-5ee0-f1c8-610e-e16391e54ee2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/25/23 07:00, Bagas Sanjaya wrote:
> #regzbot introduced: 7b63a88bb62ba2 https://bugzilla.kernel.org/show_bug.cgi?id=217701
> #regzbot title: OOB protocol access fix breaks Elan Touchpad 1206
> 

Looks like the wrong culprit (see [1]), thus:

#regzbot introduced: v6.1..v6.4

Thanks.

[1]: https://lore.kernel.org/linux-input/ZL8S2%2FUjprk4KgzT@google.com/

-- 
An old man doll... just what I always wanted! - Clara

