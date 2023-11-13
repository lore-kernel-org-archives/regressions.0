Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AB723742
	for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 20:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="UP5FkZVH"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-779d0c05959so43959685a.1
        for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 12:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699908434; x=1700513234; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Fx6QUyLMz9B8gu60tZVZ47EVcKYLf9ccbX2P1+4WqM=;
        b=UP5FkZVHM/g2yZsuIZWzUYNr7PQsAkLQnG1Us3VCo1JcQhEoLFwur3Rc515I12e7kE
         TqnljRUncYbmhBP4oxpWQxPqYil1Q8jMBxG9wS7cZ6stXBmwzPBSluYOFlXc5OZIPTi5
         0ctlwwl57GTsoTvxz+z8r2HMGc09MJl+fw2C8IwFSOailqzDX1GUs3r1BlSKdC43JE0S
         5DSnt7JivT6sNLJQnVCD+O4yGEsUX5jsaUC7EH23yMXYVMKCiBPP/OyR8mL75NM/DT8T
         72aiSyR8vsMRxmTeCizA8bRFhnPnDyaRFeh2AOHawk6kLP9lTcJZdMSkc17gtgyRrTll
         yyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699908434; x=1700513234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Fx6QUyLMz9B8gu60tZVZ47EVcKYLf9ccbX2P1+4WqM=;
        b=Sl6bY77YU+BtL/LK5Gra0Qr+3dMi1kpvXdB9Mj4NxBdKQCZRNuUyxWmG7uCRXZLkjw
         lUfnmaYshcEqkk3cukhPxnWc/zPugmLkq5gTU229CBj9VBjnkdZirm1+ZRkVgrVUsz70
         S8z9M7HKkAuqC/Ju1ne+2JfHfbWE9CTDmZLG2ARsiUsK2x2JnbnGVfXjZ59kHuuIjvk4
         XrglD0c94CLFZyu+pkCkXRxud+vky+6Aoq0nZ4cyTY+GH2V1d5V7fyatNnZP548tJNuR
         oISghr07JQFc4rGvKtIzahOei2nULBNuB+1cdgolRV2xlHONgnyriqa8A/JZZjegSVsd
         QoqA==
X-Gm-Message-State: AOJu0YwIIqhgeY9a6AjrUbnaqB7qsbYZi8LBmul3czJnPH2S3zO4zInj
	rpjWSN/GhOhReCYDtIWvVL8iDQ==
X-Google-Smtp-Source: AGHT+IE9c0knb6grqqrOghQoXPin9FxAXo2V/XhcIFWXZus/8VqZgD2SIk08jNwL9oR16INDk6SIAA==
X-Received: by 2002:a05:620a:31a8:b0:77a:69a1:b6a3 with SMTP id bi40-20020a05620a31a800b0077a69a1b6a3mr452162qkb.1.1699908434527;
        Mon, 13 Nov 2023 12:47:14 -0800 (PST)
Received: from [172.20.4.17] ([12.191.197.195])
        by smtp.gmail.com with ESMTPSA id i6-20020a37c206000000b007788d2f3d4asm2137197qkm.39.2023.11.13.12.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 12:47:13 -0800 (PST)
Message-ID: <4fa13453-cd23-4122-870a-83902787d541@kernel.dk>
Date: Mon, 13 Nov 2023 13:47:13 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in io_uring, leading to data corruption
Content-Language: en-US
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: regressions <regressions@lists.linux.dev>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <9867b2be9c0845f9f2e3a16f91f40574.squirrel@vali.starlink.edu>
 <a29fcb47-de03-46a7-b4d1-47a6c9a28879@kernel.dk>
 <1475520442.46161385.1699590908294.JavaMail.zimbra@raptorengineeringinc.com>
 <776997436.46185793.1699598887190.JavaMail.zimbra@raptorengineeringinc.com>
 <eee9b0ff-dae7-4613-8c63-fed1043e047c@kernel.dk>
 <414471427.46558741.1699728159797.JavaMail.zimbra@raptorengineeringinc.com>
 <634718570.46592899.1699739843363.JavaMail.zimbra@raptorengineeringinc.com>
 <172487905.47043248.1699895175662.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <172487905.47043248.1699895175662.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/23 10:06 AM, Timothy Pearson wrote:
> When the bug is hit, and if all other conditions are exactly correct,
> *something* (still to be identified) writes 32 bytes of gibberish into
> one of the mariadb in-RAM database pages at a random offset.

Do you have one or more examples of what those 32 bytes look like?
Ideally more than one. Would be nice if we could deduce something from
the content there. A long shot, but...

-- 
Jens Axboe

