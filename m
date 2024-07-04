Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845AA1A0AED
	for <regressions@lists.linux.dev>; Thu,  4 Jul 2024 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720090237; cv=none; b=i6s6gA2+Jbk6Bi4noQ0Iage7HmQgVLm/qjNUavJfrnxUodbkf3wb3pTDcTnYhRtYu8xCdGpzA8ceOYu7MR1dT293NsUo1U1ygh7fZqiwu/1VbcxgE1ccp+QXluHyBvtwEsC60bS8PVxjUCBTgfleN8Pwv4zsrlsCh5Trb2qiiuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720090237; c=relaxed/simple;
	bh=LzvgPwYFjl1MDjfcUuUst3k5dNh3iceb4bK4QJzJpHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqOODUbE5zWNntqqz2Ev5Us5CJBGg7T98fQVXoRWoc5edI1+gxnRB5RhwtqO79HkGpbv8KMqeM6ZJYDdsTy2W2wWzIX1H0QeowujRZcv3Pzn6NQhP8xfqZN15f4UEaDQ5JvfcY58BVC+S3p/bdAXQjHw3ehaJuZeGzq8xQe4aeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOq/shno; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOq/shno"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6b5e883d266so162366d6.1
        for <regressions@lists.linux.dev>; Thu, 04 Jul 2024 03:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720090235; x=1720695035; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PXhn73RRUDapGKjVhIDQZks7sX47YFwkaiUfPLQi+LU=;
        b=SOq/shno9TBI5++cUpBzmLfCUCv02RKcuCCAN1yVtZLZclBzaYi//bu7qW536KnedT
         X9UijzDDQbnmT9FO6r34xeXsH0kQTKmons/TYYNDYJXxCl9ruQMSqy3p871eBWzItlFu
         PBtpyjKl5VsEcRof8Dl6Rg0EcOB9K43a04eMBXfPa9fY7jnTVFU8HlXX240sVYV3w+0g
         lQde6EfzEcQtF4OarNNRmfcNc95Q8p5yf0f6sepadkiIAOXF05R2b5OTP4yiBmWedBBr
         qmf1t0OTYeQHjEd0zyocep0Gtp/ydpmTpgtxjmp9deKcziaDx/bYr81VAbFm4aSSDXnC
         Fv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720090235; x=1720695035;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXhn73RRUDapGKjVhIDQZks7sX47YFwkaiUfPLQi+LU=;
        b=YlQooQ8b/WKwAHCbeR+Ee+uVkYr3zxQeLjFqLpJBqtHOzt6czCA9k5SiiTOcaqKlIn
         W42fokmnTIM/2Pj+I3VZnbYA2HzGvfDKqFK3oHPIdvhlUqt4JOpxzmSN/m3zk2iRj5rl
         eCEH8q1jcL7niMcA7aBoZnsWfXUSkm3slYOCLrhfGZDAfjkodA7VuYRdVc0LfQB37Y9G
         tBfh6sXOVUHvACfeXwa2SbZ24SkmZamuijFbtrGv9IoTN0oXk/yE9OP3+QzkHwSZihGO
         aknzPRqgUDiRz+TTgQsa/Aj+cU8eJixZqe7u1FrO8bjY4f7ucOiUtgbFOlJVEV1DPmvd
         8+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVqWr2UwliYj8ImBsOHwKWqxqct6nd+dVEtZbhjhN1L1XaAlemnFJxV/3EdAP27X1k8GJwp+iEPVR31/iLr/DZhPhfJoDg5EMhqfJc=
X-Gm-Message-State: AOJu0YxBZvpbrcsIgSSozMBdFQP6blw4lQQgN4oYebbf2TPL6ZkZFMVY
	2wdjSaSbhgyYLRrpIjKA/TKyCNpsb8p2J2Vmrd+R47JedNMWcuouTJW+qR2QZezO1+1bBYSQWcn
	QkbBT5vjK4c11O/Bb4iMds4yjM4w=
X-Google-Smtp-Source: AGHT+IEtUOsGI1TnADSbJoqipSkoFyTTrpaJCe39ZwWdA4kT6SzSpuwXn0xDHVu7FzMr9IUdPeE8E3JR4XUWS/ZVhw4=
X-Received: by 2002:a05:6214:4106:b0:6b5:ddc3:f610 with SMTP id
 6a1803df08f44-6b5ed2e2cb2mr11224536d6.6.1720090235325; Thu, 04 Jul 2024
 03:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMmmb36ym8hVNGTiU8yfUS_cGvoUmGCcBrGWq9OxTrs+A@mail.gmail.com>
 <CAL3q7H4yBx7EAwTWWRboK78nhCbzy1YnXGYVsazWs+VxNYDBmA@mail.gmail.com>
 <CABXGCsMWYaxZry+VDCgP=UM7c9do+JYSKdHAbCcx5=xEwXjE6Q@mail.gmail.com>
 <CAL3q7H7Xb9FQx-5PMQtK_-reMq-cbfysCx6s-ZOWL1FUPSm8sA@mail.gmail.com>
 <CABXGCsP9tSwgR4dN-k97maqHB1KOtykakmHNz78SYbAuHydUTQ@mail.gmail.com>
 <CAL3q7H6vG6PEKjcsXtSuq=yks_g-MczAz_-V96QSZCs9ezRZpg@mail.gmail.com>
 <CAL3q7H5RC6dinsA2KLtus07jxDuY1PecPXbhYOWtW+nVyzXwuA@mail.gmail.com>
 <CAL3q7H4MiarsqxSMc0OzY2TNRk8J7Lg+89MaPHY2+NPO-EcDgQ@mail.gmail.com>
 <CAK-xaQYYx6SPQaOVwL+ardB0y5LzYJw9a_hfWWtVEZ=y1rXq5w@mail.gmail.com>
 <CAL3q7H74jpSoMvvkSvmrtB_VGiscz8zN5aHnApWuYU+hpKe+rA@mail.gmail.com> <CAL3q7H6V9M0B4jmW79keUtTdjWsabyWZeU5g4KEN5_-a+wEHVQ@mail.gmail.com>
In-Reply-To: <CAL3q7H6V9M0B4jmW79keUtTdjWsabyWZeU5g4KEN5_-a+wEHVQ@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 4 Jul 2024 15:50:22 +0500
Message-ID: <CABXGCsO58RJo23-vitp5+XY_nsq+xEA11LUC1-iwgBZYWQKPmw@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: Filipe Manana <fdmanana@kernel.org>
Cc: Andrea Gelmini <andrea.gelmini@gmail.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, 
	dsterba@suse.com, josef@toxicpanda.com
Content-Type: multipart/mixed; boundary="0000000000007581fa061c69b71c"

--0000000000007581fa061c69b71c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 2:57=E2=80=AFPM Filipe Manana <fdmanana@kernel.org> =
wrote:
>
> I wonder if you have bpftrace installed and can run the following
> script while doing the test:
>
> $ cat bpftrace-em-shrinker.sh
> #!/usr/bin/bpftrace
>
> tracepoint:btrfs:btrfs_extent_map_shrinker_scan_enter
> {
> time("%H:%M:%S ");
> @start_em_scan[tid] =3D nsecs;
> printf("%s enter shrinker scan %ld nr %ld root %llu ino %llu\n",
>        comm, args->nr_to_scan, args->nr, args->last_root_id, args->last_i=
no);
> }
>
> tracepoint:btrfs:btrfs_extent_map_shrinker_scan_exit
> /@start_em_scan[tid]/
> {
> time("%H:%M:%S ");
> $dur =3D (nsecs - @start_em_scan[tid]) / 1000;
> delete(@start_em_scan[tid]);
> printf("%s exit shrinker drop %ld nr %ld root %llu ino %llu | %llu us\n",
>        comm, args->nr_dropped, args->nr, args->last_root_id,
> args->last_ino, $dur);
> }
>
> END
> {
> clear(@start_em_scan);
> }
>
> The run it like:
>
> $ ./bpftrace-em-shrinker.sh 2>&1 | tee em_shrinker_log.txt
>
> And provide the log file.

I applied all four patches and still not seen any improvements:
6.10.0-0.rc6.53.fc41.x86_64+debug with patch (1-4)
up  1:02
root         269 27.9  0.0      0     0 ?        R    10:00  17:29 [kswapd0=
]
up  2:00
root         269 43.7  0.0      0     0 ?        R    10:00  52:47 [kswapd0=
]
up  3:00
root         269 40.5  0.0      0     0 ?        R    10:00  73:22 [kswapd0=
]
up  4:00
root         269 43.9  0.0      0     0 ?        R    10:00 105:30 [kswapd0=
]
up  5:00
root         269 48.7  0.0      0     0 ?        R    10:00 146:22 [kswapd0=
]

Also, I attached em_shrinker_log.txt in the archive.

--=20
Best Regards,
Mike Gavrilov.

--0000000000007581fa061c69b71c
Content-Type: application/zip; name="em_shrinker_log.zip"
Content-Disposition: attachment; filename="em_shrinker_log.zip"
Content-Transfer-Encoding: base64
Content-ID: <f_ly755bty0>
X-Attachment-Id: f_ly755bty0

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
ARR9hmZQSwUGAAAAAAEAAQBZAAAA6AUAAAAA
--0000000000007581fa061c69b71c--
