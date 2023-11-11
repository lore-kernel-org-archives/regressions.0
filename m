Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5883D980
	for <regressions@lists.linux.dev>; Sat, 11 Nov 2023 00:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRKabC66"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-6b2018a11efso2685986b3a.0
        for <regressions@lists.linux.dev>; Fri, 10 Nov 2023 16:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699660805; x=1700265605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=o7kaP8T4h9GxAv1rdpZ3a0uPOemoQbn+rBlYSoxOFnU=;
        b=CRKabC66K6NbGFCwK+WUuQ0sHnJMQE1hYymMpuWL21dMqYBZQzN+OLKsrHylwcbN5l
         5zWDQm6dLUcNjoSJ5Djf1I6zI/QaKBrOccowquX1kx45IAFZT9pFj/yrtyh5LYKe4qXH
         eTy5C36EJw83W2GPzgnlViyWlZEfnJzQOU4b7f6NRfUG9BYzlF1I39KOr/2FdJRypxVB
         srElOKwmMAqTplwCF1N522hhD1RxME110tcnk3adlcrhWWr8Yq81h+aUP66Vx5TggPu3
         us0DbpTiuqgC2hR1h7RlaanyXabiv7uIuVF+7cFKXrPzWneXDfBEdAYzBF4YLDjE5UB8
         k/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699660805; x=1700265605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7kaP8T4h9GxAv1rdpZ3a0uPOemoQbn+rBlYSoxOFnU=;
        b=QF08zPNnDynQam0bO1XymSCDTfzKgishDfWrkFI2hpHOEL0bZL7G9gbvekikvBx3GF
         u+NlhCbUmyBWWAoS3OokWFZThJ+zE/to0/9QagvsEGEGHN1d0fNcmjGPhsimDloL2L+7
         QIjfTY71cgAxQgAIo4blPWw54zO2uuBZO3VYoi/+7njWu/hgHBaTI+3fdQ4IW5XZZ6Zl
         y0iRmSpVbW2Eo2hY4iMKmuOUVX7HbIn7WDSNbt4P0PNt90H9c52aD/lEQF+4xqcbouOw
         sdMMrceh02ikrg/AS8LJ9UJlQoWsaqi3/8AnDbhXdydUnJLmehmwJJgB3z+vQAi4iL3y
         7t6Q==
X-Gm-Message-State: AOJu0YzlM4Aaq1RKvOWHvKpE58y0DktVERmKaAD14DSSnL1951LH4MKi
	7t1gjMvLBvS/I/13EaRknRc=
X-Google-Smtp-Source: AGHT+IHTNf6aZkFIAKZmSoN2cQ0u+j/7iPyq9j1l9V5ExsYYUwjQeVzARU4kSOmI2y50Ss8N84omMQ==
X-Received: by 2002:a05:6a20:1593:b0:17b:426f:829 with SMTP id h19-20020a056a20159300b0017b426f0829mr793932pzj.37.1699660804262;
        Fri, 10 Nov 2023 16:00:04 -0800 (PST)
Received: from bvd0 ([240b:252:381:6800:d42:63f5:5b67:37bd])
        by smtp.gmail.com with ESMTPSA id x66-20020a626345000000b006933f85bc29sm284620pfb.111.2023.11.10.16.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 16:00:03 -0800 (PST)
Sender: Bhanu Victor DiCara <00bvd0@gmail.com>
From: Bhanu Victor DiCara <00bvd0+linux@gmail.com>
To: linux-raid@vger.kernel.org
Cc: regressions@lists.linux.dev, song@kernel.org, jiangguoqing@kylinos.cn,
 jgq516@gmail.com
Subject:
 [REGRESSION] Data read from a degraded RAID 4/5/6 array could be silently
 corrupted.
Date: Sat, 11 Nov 2023 09:00:00 +0900
Message-ID: <5727380.DvuYhMxLoT@bvd0>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

A degraded RAID 4/5/6 array can sometimes read 0s instead of the actual data.


#regzbot introduced: 10764815ff4728d2c57da677cd5d3dd6f446cf5f
(The problem does not occur in the previous commit.)

In commit 10764815ff4728d2c57da677cd5d3dd6f446cf5f, file drivers/md/raid5.c, line 5808, there is `md_account_bio(mddev, &bi);`. When this line (and the previous line) is removed, the problem does not occur.

Similarly, in commit ffc253263a1375a65fa6c9f62a893e9767fbebfa (v6.6), file drivers/md/raid5.c, when line 6200 is removed, the problem does not occur.


Steps to reproduce the problem (using bash or similar):
1. Create a degraded RAID 4/5/6 array:
fallocate -l 2056M test_array_part_1.img
fallocate -l 2056M test_array_part_2.img
lo1=$(losetup --sector-size 4096 --find --nooverlap --direct-io --show  test_array_part_1.img)
lo2=$(losetup --sector-size 4096 --find --nooverlap --direct-io --show  test_array_part_2.img)
# The RAID level must be 4 or 5 or 6 with at least 1 missing drive in any order. The following configuration seems to be the most effective:
mdadm --create /dev/md/tmp_test_array --level=4 --raid-devices=3 --chunk=1M --size=2G  $lo1 missing $lo2

2. Create the test file system and clone it to the degraded array:
fallocate -l 4G test_fs.img
mke2fs -t ext4 -b 4096 -i 65536 -m 0 -E stride=256,stripe_width=512 -L test_fs  test_fs.img
lo3=$(losetup --sector-size 4096 --find --nooverlap --direct-io --show  test_fs.img)
mount $lo3 /mnt/1
python3 create_test_fs.py /mnt/1
umount /mnt/1
cat test_fs.img > /dev/md/tmp_test_array
cmp -l test_fs.img /dev/md/tmp_test_array  # Optionally verify the clone
mount --read-only $lo3 /mnt/1

3. Mount the degraded array:
mount --read-only /dev/md/tmp_test_array /mnt/2

4. Compare the files:
diff -q /mnt/1 /mnt/2

If no files are detected as different, do `umount /mnt/2` and `echo 2 > /proc/sys/vm/drop_caches`, and then go to step 3.
(Doing `echo 3 > /proc/sys/vm/drop_caches` and then going to step 4 is less effective.)
(Only doing `umount /mnt/2` and/or `echo 1 > /proc/sys/vm/drop_caches` is much less effective and the effectiveness wears off.)


create_test_fs.py:
import errno
import itertools
import os
import random
import sys


def main(test_fs_path):
	rng = random.Random(0)
	try:
		for i in itertools.count():
			size = int(2**rng.uniform(12, 24))
			with open(os.path.join(test_fs_path, str(i).zfill(4) + '.bin'), 'xb') as f:
				f.write(b'\xff' * size)
			print(f'Created file {f.name!r} with size {size}')
	except OSError as e:
		if e.errno != errno.ENOSPC:
			raise
		print(f'Done: {e.strerror} (partially created file {f.name!r})')


if __name__ == '__main__':
	main(sys.argv[1])



