Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0984310969
	for <regressions@lists.linux.dev>; Fri,  6 Oct 2023 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwA7jaLZ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c760b34d25so16870145ad.3
        for <regressions@lists.linux.dev>; Fri, 06 Oct 2023 07:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696601645; x=1697206445; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=se+93OT/Osj2QCJD0bLmh5PXf8LhiyfIU3o8SYbOIfk=;
        b=FwA7jaLZwp31SBcrdT3mJwqH8gUTdAQZlkm2zZ43gdXSKNYxGMhnjhIUMNrvXQwhQb
         yDWSIhz2DTyil4N6DWhRNcbO5wBBYjWlTUMuea0Ku0yvADuUZQuiZDYJ8FacJ52ZXncr
         hJL2Y/3qlDcebRpsp9W6AjwChXc8rB+Xw8fjDHA3zOiD5eHhKOFOBKqlm0zJBjx6auzT
         PzIn/x6VOUXXXV57Q7dFSIWGdC4vaLCbb4kBRicKcpyOqUIprplxiDwifO1w3wh6+dzn
         UsMFn9Tcp1Bo43H9en3TmliBOtuZWl5mnhODDJ2uTFUtMcdS1mjsFhl7q/E5gapn9aIW
         6RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696601645; x=1697206445;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=se+93OT/Osj2QCJD0bLmh5PXf8LhiyfIU3o8SYbOIfk=;
        b=qY7OKbFYsLaKESd/5J0gO5CJxsKPmszR5kldPOHWsMZ6cHPsmIiTSbPOFAYrABnJm8
         j3yp0OAelwziGIWLVARYZ7KcZSWgJh9cbF6vEywSzlWdlC0AONdlYml36ve/kEehA9jn
         Olh76fvdxGOKgTxiCAEO4mOpzXWxf7iHS8NwIDPB8jG/ZbKEJwJ2oFabZAQpric5NJ6s
         O7nwrc/EH3VT5XODkAj21VtrW9fR3jWnQQ+enxPinuoSa64c7jYRkRxHxUoKh0rJyf3p
         5w02oxRY4A9qzsPLnAcLzvzSkkHBwRRhbQcMpHZ1gMXH8DhRdyQKsM7xqmK2NwPqQ3Dr
         GlmA==
X-Gm-Message-State: AOJu0Yxz5cYMdkws09vqamcYuzqHBZbfp4P5H5bv9YSbMo8JZ+6QS0yv
	044JFrrSNpbRzwVvQ7G6EeM=
X-Google-Smtp-Source: AGHT+IHXpB3kWyz99GEFTIMPxct/mdKgGLEGMKjfizAva+sEXhbN+7W4V3GP6TJHgppuXPuqTHYDnQ==
X-Received: by 2002:a17:903:2305:b0:1c6:c3f:9dc3 with SMTP id d5-20020a170903230500b001c60c3f9dc3mr8663224plh.54.1696601645140;
        Fri, 06 Oct 2023 07:14:05 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902dad000b001c5fda4d3eesm3880746plx.261.2023.10.06.07.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 07:14:04 -0700 (PDT)
Message-ID: <31b59df2-d668-478e-a546-c3805f74c3a3@gmail.com>
Date: Fri, 6 Oct 2023 21:13:49 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Userland interface breaks due to hard HFSC_FSC
 requirement
Content-Language: en-US
To: Christian Theune <ct@flyingcircus.io>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
References: <297D84E3-736E-4AB4-B825-264279E2043C@flyingcircus.io>
 <207a8e5d-5f2a-4b33-9fc1-86811ad9f48a@leemhuis.info>
 <879EA0B7-F334-4A17-92D5-166F627BEE6F@flyingcircus.io>
 <740b0d7e-c789-47b5-b419-377014a99f22@leemhuis.info>
 <BBEA77E4-D376-45CE-9A93-415F2E0703D7@flyingcircus.io>
 <982dc76d-0832-4c8a-a486-5e6a2f5fb49a@gmail.com>
 <0AAB089F-A296-472B-8E6F-0D60B9ACCB95@flyingcircus.io>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <0AAB089F-A296-472B-8E6F-0D60B9ACCB95@flyingcircus.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2023 19:37, Christian Theune wrote:
> Hi,
> 
>> On 6. Oct 2023, at 14:07, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>
>> On 06/10/2023 17:51, Christian Theune wrote:
>>> Hi,
>>>
>>> sorry, no I didn’t. I don’t have a testbed available right now to try this out quickly.
>>>
>>
>> Please don't top-post; reply inline with appropriate context instead.
> 
> Sorry, I will avoid that in the future - I was a bit in a hurry and thus negligent, but you’re right of course.
> 
>> You need to have testing system, unfortunately. It should mimic your
>> production setup as much as possible. Your organization may have one
>> already, but if not, you have to arrange for it.
> 
> I’m able to do that, I just didn’t have one at hand at this very moment and no time to prepare one within a few minutes. I’ll try to reproduce with a 6.6rc in the next days.
> 

OK, thanks!


-- 
An old man doll... just what I always wanted! - Clara

