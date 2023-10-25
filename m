Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4425156E5
	for <regressions@lists.linux.dev>; Wed, 25 Oct 2023 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="RXGfNH9G"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7a680e6a921so68011639f.1
        for <regressions@lists.linux.dev>; Wed, 25 Oct 2023 08:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1698248163; x=1698852963; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnuRFrtZBpuNFclBQXRPUdRtFW5zT4PqP+dECAz1in8=;
        b=RXGfNH9GacDFBCwEOrgHlqXjFrTk3oqpBt4AO+44qKTwYj8NdSk6vWibkUyFWfwnVf
         6MMI0kQLM5wu6UJJUmrMAF6Fxys/u+po02ToOJCUNKEr18cqfyVIx2acmdKf+OzYwC/2
         QIuZzAXamXAEBLX+xunUDlKHeK/17ypzyjqmwQN4u/ID/zcP7vYZXIinYvBLLn8qo3OF
         u9RjbpzT+qd0vd+2muATgDVAUctvD0T7QsyacPQ1kSPXLglaklYyyiqGVAenF6sZxu4S
         0/6j4biECgyfk8imvMg2bpYLAuP8vuAiWIQm6xxUvK4P/tlJl4NJOhfe15X1BgavCtaJ
         WjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698248163; x=1698852963;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnuRFrtZBpuNFclBQXRPUdRtFW5zT4PqP+dECAz1in8=;
        b=NsUhdHTxJpl9A58xvKOcj5oY0XMjZ/mI2aGY3FFlX2D6/rvmkNCBvG1GmPwfx9zSlI
         7q6m+LgkHKCQimqA1wTydh0SWwXUMhCpOZ8qcYNks78KC/smWygZZm3Ol+3PD/2iQ7KZ
         vIzanWv1nn34IMLQzJQtxp70gMo1Yczo+nucRORKu3DxfFi6NLnRBQNsgRZ4HAbrDNpU
         0dunqVbKTf51kGt8WnWuSVW6ZnSai3jRCVfeR0BfvT2tJpaU2cRVUOPil6znTL93NBJD
         ilf/x8HNj3rXE+8A+NDxMQP9x5Rpg3qcgCofxVI4OWjVAXK8y0ucSpG60wKmfxOrpLyj
         JNuQ==
X-Gm-Message-State: AOJu0YzQGTc0yxxQ0JwRuvG468ifg7GCphx21h9oKPCfKgozbA3vESKP
	CgGwFnbPjnKOR9stzoY0bhHBzioHNI59TX0DfHN4XQ==
X-Google-Smtp-Source: AGHT+IEOLRtW5YwlT60QddLXFI/rLcPlmOHK2aANzAgxSiLa1sZUbzM8HDq6JCpjwUL/NH5D/cEq0A==
X-Received: by 2002:a5e:d70d:0:b0:79f:a8c2:290d with SMTP id v13-20020a5ed70d000000b0079fa8c2290dmr16583391iom.0.1698248162883;
        Wed, 25 Oct 2023 08:36:02 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id s8-20020a02cc88000000b004567567da78sm19032jap.151.2023.10.25.08.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 08:36:02 -0700 (PDT)
Message-ID: <b5578447-81f6-4207-b83d-812da7c981a5@kernel.dk>
Date: Wed, 25 Oct 2023 09:36:01 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: task hung in ext4_fallocate #2
Content-Language: en-US
To: Andres Freund <andres@anarazel.de>
Cc: Dave Chinner <david@fromorbit.com>, Theodore Ts'o <tytso@mit.edu>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Shreeya Patel <shreeya.patel@collabora.com>, linux-ext4@vger.kernel.org,
 =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 gustavo.padovan@collabora.com, zsm@google.com, garrick@google.com,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 io-uring@vger.kernel.org
References: <20231017033725.r6pfo5a4ayqisct7@awork3.anarazel.de>
 <20231018004335.GA593012@mit.edu>
 <20231018025009.ulkykpefwdgpfvzf@awork3.anarazel.de>
 <ZTcZ9+n+jX6UDrgd@dread.disaster.area>
 <74921cba-6237-4303-bb4c-baa22aaf497b@kernel.dk>
 <ab4f311b-9700-4d3d-8f2e-09ccbcfb3df5@kernel.dk>
 <ZThcATP9zOoxb4Ec@dread.disaster.area>
 <4ace2109-3d05-4ca0-b582-f7b8db88a0ca@kernel.dk>
 <20231025153135.kfnldzle3rglmfvp@awork3.anarazel.de>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20231025153135.kfnldzle3rglmfvp@awork3.anarazel.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/25/23 9:31 AM, Andres Freund wrote:
> Hi,
> 
> On 2023-10-24 18:34:05 -0600, Jens Axboe wrote:
>> Yeah I'm going to do a revert of the io_uring side, which effectively
>> disables it. Then a revised series can be done, and when done, we could
>> bring it back.
> 
> I'm queueing a test to confirm that the revert actually fixes things.
> Is there still benefit in testing your other patch in addition
> upstream?

Don't think there's much point to testing the quick hack, I believe it
should work. So testing the most recent revert is useful, though I also
fully expect that to work. And then we can test the re-enable once that
is sent out, I did prepare a series. But timing is obviously unfortunate
for that, as it'll miss 6.6 and now also 6.7 due to the report timing.

FWIW, I wrote a small test case which does seem to trigger it very fast,
as expected:

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <liburing.h>

#define BS	4096
#define FSIZE	(128 * 1024 * 1024UL)

static int set_file_size(int fd, off_t file_size)
{
	off_t this_size;
	char buf[BS];
	int ret;

	memset(buf, 0, BS);
	this_size = 0;
	while (this_size < file_size) {
		ret = write(fd, buf, BS);
		if (ret != BS) {
			fprintf(stderr, "write ret %d\n", ret);
			return 1;
		}
		this_size += BS;
	}
	fsync(fd);
	posix_fadvise(fd, 0, file_size, POSIX_FADV_DONTNEED);
	return 0;
}

int main(int argc, char *argv[])
{
	struct io_uring_sqe *sqe;
	struct io_uring_cqe *cqe;
	struct io_uring ring;
	off_t off, foff;
	int fd, i, ret;
	void *buf;

	if (argc < 2) {
		fprintf(stderr, "%s <file>\n", argv[0]);
		return 1;
	}

	fd = open(argv[1], O_RDWR | O_CREAT | O_TRUNC | O_DIRECT, 0644);
	if (fd < 0) {
		perror("open");
		return 1;
	}

	if (set_file_size(fd, FSIZE))
		return 1;

	if (posix_memalign(&buf, 4096, BS))
		return 1;

	io_uring_queue_init(8, &ring, 0);

	i = 0;
	off = 0;
	foff = FSIZE + BS;
	do {
		sqe = io_uring_get_sqe(&ring);
		io_uring_prep_write(sqe, fd, buf, BS, off);
		off += BS;
		if (off == FSIZE)
			off = 0;

		io_uring_submit(&ring);

		ret = posix_fallocate(fd, 0, foff);
		if (ret < 0) {
			perror("fallocate");
			return 1;
		}
		foff += BS;

		ret = io_uring_wait_cqe(&ring, &cqe);
		if (ret) {
			fprintf(stderr, "wait cqe %d\n", ret);
			return 1;
		}

		io_uring_cqe_seen(&ring, cqe);
		i++;
		if (!(i & 1023))
			fprintf(stdout, "Loop iteration %d\n", i);
	} while (1);

	return 0;
}

-- 
Jens Axboe

