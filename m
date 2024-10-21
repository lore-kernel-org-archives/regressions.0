Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140EF1B59A
	for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 15:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729524574; cv=none; b=Eoqp2FoXJcFrq59fdfdTjM4TBUsHwhoP7LepEnkIqgcweNxkWIKNCKZBHKsBrA4kzboJtoI8eTfY6+gN0Zbn5JDyMjkevig/7fiYvwldQNByOwDCN4UFTzyGTKstJR0Kduk1WmvHH/GFGH3VvO2n3MVTIHprBd7nINb1tsJq9Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729524574; c=relaxed/simple;
	bh=iWtNGW5Lv+npAxLvYrzDrlBlld7h6q5Bl55LXxDdRso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJASahEfz86KAL7f3PNqRHkYo/hFZ3iKRWCEGtK+wqdfaJ9+rDjTB0FqQSwbzW0cc2nwPbC8yheO5rkg/ZayT4jB3kooni+RflZHrEJXPsEZ52dT9swfDleDRBHlRnIaNusElfAiQRmDYMcTMNQWPe8ZfT2IVTA6nrn49OmatqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GQMI2T9z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GQMI2T9z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729524570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O6AOTgcFjOO6pusSxpBSQAWFHjn8ww3tmBzZVY0f3ik=;
	b=GQMI2T9z88wVEpf7TmVROTnMC0s47mT9B6qGaBlD5GWBVZI+w9zvlNhYgOd5yHSjJkU/Dp
	uG0HQrDmZVeZzixf/0ZKEK0K+IkLCZHauN74vZZ023I48Lq7Ju60NHlTPbhkqOAs79dEyl
	Dnaoj1cInnljHzbf/bwF8516tpSW5+o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-jkZpCOWXOT-enh5EHfsgGA-1; Mon, 21 Oct 2024 11:29:29 -0400
X-MC-Unique: jkZpCOWXOT-enh5EHfsgGA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4316138aff6so27544885e9.1
        for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 08:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729524568; x=1730129368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6AOTgcFjOO6pusSxpBSQAWFHjn8ww3tmBzZVY0f3ik=;
        b=VY9yFD2Ilk9Vz1Jv3IMfw2gM4ZmsOiZvliCl+O3NlbZpW6wwb9nh8d7VJ6h4M4z6h+
         eJTc74VoPoQgHOEdkID+KfyCg+Ffef1LccFNndQ6MvOlpzQze8zvOEes28U6mkReVKBV
         tQDI4zyiBWYbGYWPNaGJ2aavleAAszdWDH63gVwwUKElY4kq/Ye8IHZDOie2OI7jVnxJ
         +xMbIL2FlpR7KEwCKWiEoGhd9/2ceiKzhVbK7q09qGJNv8GkABqblI2gtCmz8Fgi/pVf
         cECpza0sQVqCVy6NOKa8goHxDSY5/pos6WgrOfC2VeRkL/33SulJS5PDYBIpa/oc5zJK
         rV8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjuxgJdu7mQP+ky8Lf3U+FwvGrd432UGAr8pj4X52pbmggPTIkuG7+vXhq6DeY0F66WW+Op7u86370LQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwW9h1HzbnVTTeFevWqIpBU+pR+kTKz6w1mDWTJIeKTq4SxXZWu
	5WHVXJSnTpYVC3XJL4lHCAbaNEWruURHsEOh/LP3dbS7UdCYaPKG0NHdcnKfHzfOeKEY+zwFJB6
	fY4rNDsVzExEGbfAhBh/4t+40Xjyh7qwehsvjKOq9aCJhkO9G3iubpvlrRM+oOtXf15fpq38=
X-Received: by 2002:a05:600c:34cc:b0:426:627e:37af with SMTP id 5b1f17b1804b1-4316163330bmr91910265e9.3.1729524568389;
        Mon, 21 Oct 2024 08:29:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET+SVD6cbZPCbhAIxGjhJyIGRpEiTOiTUfwm0zjdZFXEhVQsAXQnRDfXRtvoOHzmodD7KyJA==
X-Received: by 2002:a05:600c:34cc:b0:426:627e:37af with SMTP id 5b1f17b1804b1-4316163330bmr91910075e9.3.1729524568028;
        Mon, 21 Oct 2024 08:29:28 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1b73:a910::f71? ([2a0d:3344:1b73:a910::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f570d49sm61532135e9.7.2024.10.21.08.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 08:29:27 -0700 (PDT)
Message-ID: <be9ead27-bd67-49a8-a311-a7ce5e82d4fa@redhat.com>
Date: Mon, 21 Oct 2024 17:29:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull request: bluetooth 2024-10-16
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, davem@davemloft.net,
 kuba@kernel.org
Cc: linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Eric Dumazet <edumazet@google.com>
References: <20241016204258.821965-1-luiz.dentz@gmail.com>
 <4e1977ca-6166-4891-965e-34a6f319035f@leemhuis.info>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <4e1977ca-6166-4891-965e-34a6f319035f@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/24 07:30, Thorsten Leemhuis wrote:
> [CCing Linus, the two other -net maintainers, and the regressions lists]
> 
> On 16.10.24 22:42, Luiz Augusto von Dentz wrote:
>> The following changes since commit 11d06f0aaef89f4cad68b92510bd9decff2d7b87:
>>
>>   net: dsa: vsc73xx: fix reception from VLAN-unaware bridges (2024-10-15 18:41:52 -0700)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git tags/for-net-2024-10-16
> 
> FWIW, from my point of view it would be nice if these changes could make
> it to mainline this week. I know, they missed the weekly -net merge,
> despite the quoted PR being sent on Wednesday (I assume it was too late
> in the day). 

The net PR is prepared and sent on Thursday morning - either European
Time or West Cost, depending on who actually is cooking it.

Wednesday is usually/nearly always a good time for PR to be send on
netdev to land into the next 'net' PR, but due to some unfortunate
scheduling, we are lagging behind the netdev ML traffic - to the point
that I'm processing this email only now.

The limited capacity will last for all the current week, but we should
come back to speed from the next one.

Cheers,

Paolo

