Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2485920F8
	for <regressions@lists.linux.dev>; Thu, 13 Oct 2022 07:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1665645166; x=1697181166;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=s9hcQcdAlAzyhKMWI+wdGejeFtAk0WjChyhpIcsu+pQ=;
  b=liv3MYkntAq/BwPAqIXmeVK2QN7hJG71/4a4Ds7E3Q3UDbVYW8MKkwiB
   DbYteQ1/En+h2lc+n/RCLelK99c1qYOM4vooCezHROmz1/J+rDDC0BR41
   nPQ5C3CErZGyNNHyz7HHMKnESMhFExTh7GS7JYuEJh9xeNSVjW3Gn3H9m
   Et7STt2yUe/abBJQ2QRWPoebREshnA3hbCKjDXt00yX+qmSHCPbI1f4xY
   dX/6wrtdX9wBQUFULNWomcbrYlsSU2IIzT+z32t1cfOfv1AsmvZesILFh
   QL0oFM9VIXRfWOcQU96r8fAkYND3YcStvrrVxyZ4dwyd8FMsj/XvY/6bm
   g==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661788800"; 
   d="scan'208";a="317980564"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 13 Oct 2022 15:11:34 +0800
IronPort-SDR: Xb/TYbFOJ6I1jBVLR3TEM8d5Mq3X6fL4kherT4GhZTNhqPBWA62Ax/E6M6XlcL/HZokBELJO6L
 VLp1C9/LZkdEMmAPemYCUk3vmcWOKLZofNWC2Ia+hxJJ559dj9Osvz4GD526sRQlrhmvyq7T0U
 sb/MwRurI7V5oJwwwlU9vHqeT7ZYdKkpYQsN6tBjdvLwx4Nl1r4nSyJfih5XV2jUJYKORNhfuR
 yroD0bcaqbtH4FMtZxFDvDdegp/9c8HZPq10vSqmLW6Nx8ZDvRqLY77EHfXEpGB6vkomFGmQpR
 vcP6qIdEnMKpOiCQvYuk8pid
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Oct 2022 23:31:12 -0700
IronPort-SDR: or01uCaWTs6hjJFOPu7pRp1HBb0s/ck4b37u6KEkt0hqSoqyRfK2E9jNXHfjVYKsqTXVDcD3Gr
 HQbJ2DvzzeFrZ4BhaBlMBU7Vu8yTKVWcoB56RCx9YWGDqBmxjvp5ZSaE7inc9Xkg4gZ54wzt+W
 5SlKUdBdaf/1KcKGd0A14EQ3XE3D7qDfxxKfAk6YH/p8/5dlLzPIwV6RGyI1KBUUigLFzRAO/M
 2aABLqdM/ONPLocAVYm9WZu9fjWOIwOBu8XqrQ/JzFCoLQPuiZBef88QqT74X8H7AQdTczEL3A
 y7I=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2022 00:11:35 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mp10Q0kVCz1Rwtm
	for <regressions@lists.linux.dev>; Thu, 13 Oct 2022 00:11:34 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1665645093; x=1668237094; bh=s9hcQcdAlAzyhKMWI+wdGejeFtAk0WjChyh
	pIcsu+pQ=; b=Jm7BAZerxx5v6gHfitNpZQJpv8yhR8Yz+0aNTdhqXMIfV0gn4TG
	6+TBqREYVmRm0fsOf0P2tPfEbnuwWfT7OVo/a3Bbek/+s9jvrMUa2Xb2i10ghc/Y
	HFWYEqvsVOeYJWY2tZ8/R2Sh3akv0gAH71JKPx1JTJ/I7nZemiHrqVJfvTGM4hwS
	Jkm2agszLuKjBjr501zMV0icXH2rwWiypS9DcibKSZ9VOj/9eHQuglwkEfOoYfoM
	P2aCHTQjerUy1B+jtxYnRrCfHKPvQwjr+IBSz8OnG/kCXGua9nxsTjPX0CsC713S
	wQZo94NGIjDp/m31PhwSDq664N5zNeu7fRg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fD1cyScHhJNO for <regressions@lists.linux.dev>;
	Thu, 13 Oct 2022 00:11:33 -0700 (PDT)
Received: from [10.89.85.169] (c02drav6md6t.dhcp.fujisawa.hgst.com [10.89.85.169])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mp10L5vWSz1RvLy;
	Thu, 13 Oct 2022 00:11:30 -0700 (PDT)
Message-ID: <bf1b053d-ffa6-48ab-d2d2-d59ab21afc19@opensource.wdc.com>
Date: Thu, 13 Oct 2022 16:11:29 +0900
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: TI: X15 the connected SSD is not detected on Linux next 20221006
 tag
Content-Language: en-US
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-block <linux-block@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 regressions@lists.linux.dev,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Arnd Bergmann <arnd@arndb.de>,
 Anders Roxell <anders.roxell@linaro.org>
References: <CA+G9fYvRXkjeO+yDEQxwJ8+GjSmwhZ7XHHAaVWAsxAaSngj5gg@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CA+G9fYvRXkjeO+yDEQxwJ8+GjSmwhZ7XHHAaVWAsxAaSngj5gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2022/10/12 16:24, Naresh Kamboju wrote:
> On TI beagle board x15 the connected SSD is not detected on linux next
> 20221006 tag.
> 
> + export STORAGE_DEV=/dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84
> + STORAGE_DEV=/dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84
> + test -n /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84
> + echo y
> + mkfs.ext4 /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84
> mke2fs 1.46.5 (30-Dec-2021)
> The file /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84 does
> not exist and no size was specified.
> + lava-test-raise 'mkfs.ext4
> /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84 failed; job
> exit'
> 
> Test log:
>  - https://lkft.validation.linaro.org/scheduler/job/5634743#L2580
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> metadata:
>   git_ref: master
>   git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git_sha: 7da9fed0474b4cd46055dd92d55c42faf32c19ac
>   git_describe: next-20221006
>   kernel_version: 6.0.0
>   kernel-config: https://builds.tuxbuild.com/2FkkkZ51ZYhBL1G8D69YX8Pkt5F/config
>   build-url: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/pipelines/659754170
>   artifact-location: https://builds.tuxbuild.com/2FkkkZ51ZYhBL1G8D69YX8Pkt5F
>   toolchain: gcc-10

The kernel messages that are shown in the links above do not show any "libata
version 3.00 loaded." message nor any ata/ahci message that I can see. So I
think the eSATA adapter is not even being detected and libata/ahci driver not used.

Was this working before ? If yes, can you try with the following patches reverted ?

d3243965f24a ("ata: make PATA_PLATFORM selectable only for suitable architectures")
3ebe59a54111 ("ata: clean up how architectures enable PATA_PLATFORM and
PATA_OF_PLATFORM")

If reverting these patches restores the eSATA port on this board, then you need
to fix the defconfig for that board.

-- 
Damien Le Moal
Western Digital Research

