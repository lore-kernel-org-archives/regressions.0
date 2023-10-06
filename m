Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFB3EBB
	for <regressions@lists.linux.dev>; Fri,  6 Oct 2023 06:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSnnRwgt"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c62d61dc96so13336525ad.0
        for <regressions@lists.linux.dev>; Thu, 05 Oct 2023 23:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696575439; x=1697180239; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltCjm4aJUWe9aYqASEplzIRx3exF5lO5oefAHyj9uWI=;
        b=CSnnRwgt7rIuUCYDBNz4N39/R5eQ7yJTKGUzYrrRDL+Newxkb3uG3V512pcddQYpYb
         MMWkbAVbJoy66rLJ0rvgepcJxbj6IemhvqV6pZM643Oki08AyOPAKtFovhdgSlTNtisk
         QoBAF4gf2+7IS0blnHO6BI6D4syATZJHAQD4xm+Iyfn56/v4N+e0yFW7NSctp6z+PZgU
         XQlJz2IGpGIeiSUVmhF8d+sP2659XKMclH6cl06QXKgIbe7/Nx6CIg8MPUjIfUSvaoYi
         J+Bxv4QdXY7FVU0bCPsroDU7gb6C4W2Ew+huG+YLC8iCwEJxkThlM6NbsGuOxLVy5ZJs
         KiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696575439; x=1697180239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltCjm4aJUWe9aYqASEplzIRx3exF5lO5oefAHyj9uWI=;
        b=wIqNs8g8Xgf8rbXJzWlhDHMz8+myPQsPcLI2Ho9kAZYkgG83gTe3owXS3vvTGX7/aB
         q7heVHi+i1TBNcsqXUaePMURnoxhziIg6uCB5ZNZEvL0DE0wB+jbASyzgHGH/hFMJ4Rx
         TdDgzmQJaqN9CuiQjVESPjn1GJzzG1xGROE3KMpDyVQ3t72vbWEc9aoyVUwt03LGCXXl
         WicgEYzGeHRRlz0I2O+OA8rlBjtfKZrgKZlOmle5CENwN4/RhUdvtDM8FNXNmusJB0Ad
         r/VH/gZ5/aelkkwxaJReheWcQ0PvZIlogmQZaAtoI7Wt4/q0QMk6Hw34GGbhzS/GdGoI
         qOBg==
X-Gm-Message-State: AOJu0Yw538KRpiNLqqje2xuMH1lAQuVusdCYpwdu3/MPMfIshMsiXj8r
	E4TU3N0hERFdBMn1R355Xw4=
X-Google-Smtp-Source: AGHT+IGqQwQOB9t6/yYKRaS6b8thQhpGRr5Dk8tWrNhV15C8CICkgfRtYX3GSYgryu7yNxfhJNi1eQ==
X-Received: by 2002:a17:902:ecc8:b0:1c4:29dd:2519 with SMTP id a8-20020a170902ecc800b001c429dd2519mr7615049plh.67.1696575439280;
        Thu, 05 Oct 2023 23:57:19 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902a3c100b001c61512f2a6sm3035443plb.220.2023.10.05.23.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 23:57:18 -0700 (PDT)
Message-ID: <0802bc5a-9fb0-433a-8491-47806cc7c549@gmail.com>
Date: Fri, 6 Oct 2023 13:57:12 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG: Unable
 to handle kernel data access at 0xfeffbb62ffec65fe)
To: Matthew Wilcox <willy@infradead.org>
Cc: Erhard Furtner <erhard_f@mailbox.org>,
 Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20230929132750.3cd98452@yea> <ZR9esG8H17LY2KOX@debian.me>
 <ZR9gkZKafUSNOAEf@casper.infradead.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ZR9gkZKafUSNOAEf@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/10/2023 08:19, Matthew Wilcox wrote:
> On Fri, Oct 06, 2023 at 08:11:12AM +0700, Bagas Sanjaya wrote:
>> Matthew Wilcox, did you miss this regression report? You should look into it
>> since it is (apparently) cause by a commit of yours.
> 
> No, I didn't miss it.  I'm simply choosing to work on other things.
> All this regression tracking nonsense and being told to work on things
> by people who've appointed themselves my manager has completely sapped
> my motivation to work on bugs.  If you want me to work on things, *don't*
> harass me.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

