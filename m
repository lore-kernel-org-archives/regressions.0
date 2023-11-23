Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427D117D8
	for <regressions@lists.linux.dev>; Thu, 23 Nov 2023 05:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEQNkoP0"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6bd0e1b1890so438635b3a.3
        for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 21:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700715684; x=1701320484; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spk4X+jG9kC9sYhfHPUCxUIKzBM1WIu5NlHz5meX1cg=;
        b=DEQNkoP02DGXBsryVFvNIUxsKXJLZ5wo5Wrrb6brWVCVapDOh+hrZekcqoMRagcKNN
         nZgvGba5OfnscZd1BfY6otcZh9LoNJeluy7ol9F4Pc/vcG75ThNtsC/m8HTTUtZ8MVv+
         q00SFo+ITzppCMH6Y6s9ts8VpFl9ucyMN6UmXwDZggMclokaVz4Cq4tyQ3PP2nJlunbu
         nNwSDF7PcT0SCDrHrT48m2EN5srMmnE/i0MiX+t48UZVw5rS871ms5EC6PURHglwKBx2
         NzUiGRSg6Q3rjvdrQpUzR+FY2v4WfKQvqIlHaPj5JkhY/vGXScwmRKc8+OM7MtYi7cfh
         0cEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700715684; x=1701320484;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spk4X+jG9kC9sYhfHPUCxUIKzBM1WIu5NlHz5meX1cg=;
        b=pgjPuM8FJIL73eJxwMf7XqrK/zHrGixLfxVIQgJlnsnqH3ktHWNKC3aHRVH5wu46xJ
         G9QdAx9fXYL9Xo5KzcO8yAnVHc7Oz+ro14Igk17TFTGn0j9wSL766vXn1x8g7l5HUzVh
         h7w3KnX3Z7iVUFhXYJAwehOR569Wkz1DXru2S/05kLx7e/sH/C4dAoRG29GmH0POVmwk
         ASRZRpW2FWnBjfdxCwq9WlpWB0gBLc1NIJi5+e1vxrJ1Po0E0XOdOoxU5949EkbA/9KG
         1OzmtrhiEtsyqKPMKP8f6dknzW4uDfZuynV2AuS8Ls3kD4GQBue2jdXhk2Yu16oyj0r9
         8CNA==
X-Gm-Message-State: AOJu0YzmkFNZ0t5GHIqqPwf3RhAo4DiKNSU8gELLOPco13XVzZ6MytOp
	XfZnG5QeOxQfhfVJ+X9Ct10=
X-Google-Smtp-Source: AGHT+IGF/14ncgBY07t3CKeIazyBsLqW6F1xXjOteOxP8f2tdI/1QBk7AczVlfQyKbYTX3oq4t5JmQ==
X-Received: by 2002:a05:6a20:9387:b0:18b:94c5:24c2 with SMTP id x7-20020a056a20938700b0018b94c524c2mr767609pzh.60.1700715684306;
        Wed, 22 Nov 2023 21:01:24 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id r27-20020aa78b9b000000b006cb6fee548esm349832pfd.91.2023.11.22.21.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 21:01:23 -0800 (PST)
Message-ID: <ec120f27-e2de-4429-abf2-411d090e3316@gmail.com>
Date: Thu, 23 Nov 2023 12:01:20 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION]: mmap performance regression starting with k-6.1
Content-Language: en-US
To: Chun Ng <chunn@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Ankita Garg <ankitag@nvidia.com>
References: <PH7PR12MB7937B0DF19E7E8539703D0E3D6BAA@PH7PR12MB7937.namprd12.prod.outlook.com>
 <ZV6oYmVYsyYizvgg@archie.me>
 <PH7PR12MB79373516F591C102110B4251D6B9A@PH7PR12MB7937.namprd12.prod.outlook.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <PH7PR12MB79373516F591C102110B4251D6B9A@PH7PR12MB7937.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/23/23 10:06, Chun Ng wrote:
>>> Did you mean that v6.0 doesn't have this regression?
> 
> No, k-6.0 does NOT have this regression. The regression starts from k-6.1.
> 

Thanks for confirmation.

-- 
An old man doll... just what I always wanted! - Clara

