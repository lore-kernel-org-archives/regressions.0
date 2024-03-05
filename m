Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1537C085
	for <regressions@lists.linux.dev>; Tue,  5 Mar 2024 06:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709619990; cv=none; b=J9qPwaHEUuLkUFzjs90J7uNxGjc5ULBd8FQOn4FVSI9/+X0ezxTMwl/Dmgu5w6b8RJ6UvZ+5c0DU0ekHqXKmYMB4JPQtdxvf2f3em8xv8Wi8zJLZHFkmlWPGa7DSZQxgbTtS0yD/VSsefo2m+e33KxXpLb3S5w1sPpax+Haq9x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709619990; c=relaxed/simple;
	bh=4WcwbnvG/mxYLT7NMzyd/6RuMVuKWlNOC/ALXo4rS7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQE67PvLPSll0m50t7obH/9lQjoovdZykQFGVFT33tofyF9A405fkfnsyARTLa7LUetugHzBkaSrnR8TLm8dwibJQvvBq5f9NPa3g+LXMjTkul3UPxDniUiIXg0jJOLNLiao6ulB427OVXom+RLlcXA6aCblIYkPFUIkGvkTnAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDWjlfDJ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDWjlfDJ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a36126ee41eso787954766b.2
        for <regressions@lists.linux.dev>; Mon, 04 Mar 2024 22:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709619986; x=1710224786; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqVT2JnNRbPWzcgR4c2Weugh7r6QhZGdlXDyICTLojU=;
        b=YDWjlfDJtOX7U81+TRMYWfEZ8MkHquTB9jEMQWbzbfMp7d2t5Xdw7ZpgisCPrwN5ER
         X+nq92FaxAWIO5Fhtt7+Kw8qRaYZFeMT5WShCVW26S1GDpRs/hyjMIa7biHwbRhEM0NI
         pfN9Yrt/Pzh8ihJ+PIqZqgrEo7oJnfv3PyPFfTipN2GE0ADFGVKx7DZaBo5ie77rfUFn
         hP5blvHs/6nxYe5e5DOcum3x4C4C1ggY5meYw/ZLRYRhI14AkBn+MJC7JqnDKPoRHDTz
         51yHXYqnbXgXKKajevH4o4t/72OZAiTDz8GL/0IyqVCHCSpb7ydhgZf4gmGeDG+XBjBa
         am8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709619986; x=1710224786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OqVT2JnNRbPWzcgR4c2Weugh7r6QhZGdlXDyICTLojU=;
        b=neC5lRW8ENoAjK+1xElgN3RahEiGkvbkjyM/QoSvUIZZIpDLrGf/so4JrcLYGXeJ0K
         e8EDja/DzwnQcu1/5BQfoNGW3J/mAx7HwXW3whP8fC/okJbFw6GDnNbi9QTEfk7YV0dW
         Vo+zJwiJss3G7Khk2yGZjaXAiw60qR3G5fhP37EB/Ti129bOK6La625ZYD50beUXwhYP
         RH6bRzFKQqgD7n+jndpp2bwX4KfnJqxLbw+apSD+NYo3BpBilx8PUuB2PLF/WJ6NDfM8
         rVm8XKr4Hb3fMA4jN27XC560HOM2JeisyprKfEPcclcRXoKxgIM9/4esLEP78R0n7PUy
         vg8Q==
X-Gm-Message-State: AOJu0YxO3DWMCedWhqkjMDJzRqSBM78Ifd4vMuEPAOhUHWIyEC5Vjkzl
	gfbS0sSilLzVS2wnEG5a9Soc/+501qLIAjrZvt1Aab8mTT8m6jmnqIbi2ArADMAyiw==
X-Google-Smtp-Source: AGHT+IHZdhzjgdjNLmYhH0YtNevSSWbhslBCufGVr3vJHKdif829mn4Po1yPYIlQjpS8iJmJ3unOTA==
X-Received: by 2002:a17:906:6b94:b0:a45:26fd:f5aa with SMTP id l20-20020a1709066b9400b00a4526fdf5aamr4184411ejr.17.1709619986296;
        Mon, 04 Mar 2024 22:26:26 -0800 (PST)
Received: from [10.10.51.93] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id d17-20020a17090648d100b00a45a8193aa9sm299289ejt.107.2024.03.04.22.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 22:26:25 -0800 (PST)
Message-ID: <80745896-dadb-4fcd-9485-7a476df6de16@gmail.com>
Date: Tue, 5 Mar 2024 07:26:24 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "Input: bcm5974 - check endpoint type before
 starting traffic"
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Henrik Rydberg <rydberg@bitmath.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240305-revert_bcm5974_ep_check-v1-1-db4f0422588f@gmail.com>
 <1c13f4f7-fa02-4864-8621-bfd738546fc2@leemhuis.info>
Content-Language: en-US
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <1c13f4f7-fa02-4864-8621-bfd738546fc2@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05.03.24 07:20, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 05.03.24 06:52, Javier Carrasco wrote:
>> This patch intended to fix an well-knonw issue in old drivers where the
>> endpoint type is taken for granted, which is often triggered by fuzzers.
>>
>> That was the case for this driver [1], and although the fix seems to be
>> correct, it uncovered another issue that leads to a regression [2] if
>> the endpoints of the current interface are checked. The driver makes use
>> of endpoints that belong to a different interface rather than the one it
>> binds (it binds to the third interface, but also accesses an endpoint
>> from a different one). The driver should claim the interfaces it
>> requires, but that is still not the case.
>>
>> Given that the regression is more severe than the issue found by
>> syzkaller, the best approach is reverting the patch that causes the
>> regression, and trying to fix the underlying problem before checking
>> the endpoint types again.
>>
>> Note that reverting this patch will probably trigger the syzkaller bug
>> at some point.
>>> [1] https://syzkaller.appspot.com/bug?extid=348331f63b034f89b622
>> [2] https://lore.kernel.org/linux-input/ab9d758c-3ce9-42f6-99af-877055a589e6@leemhuis.info/T/#t
> 
> FWIW, these should be Link: or Closes tags, as explained in the docs.
> And there is a better lore link. And there is the bugzilla entry as well.
> Hence...
>  
>> This reverts commit 2b9c3eb32a699acdd4784d6b93743271b4970899.
>>
>> Fixes: b516b1b0dfcc ("Revert "Input: bcm5974 - check endpoint type before starting traffic"")
> 
> you might want to add them here like this:
> 
>  Link: https://syzkaller.appspot.com/bug?extid=348331f63b034f89b622 [1]
>  Link: https://lore.kernel.org/linux-input/87sf161jjc.wl-tiwai@suse.de/ [2]
>  Link: https://bugzilla.suse.com/show_bug.cgi?id=1220030
> 
> In an ideal world we also would add a "Reported-by: Jacopo Radice" before
> the bugzilla line, as the details in the suse bugtracker apparently is
> public, but it's likely better to not go down that path.
> 
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> 
> Ciao, Thorsten

Thanks for your comments, I will apply those changes right away and add
the "Repported-by:" tag as well.

Best regards,
Javier Carrasco
