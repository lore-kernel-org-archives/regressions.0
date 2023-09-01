Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC0EA92C
	for <regressions@lists.linux.dev>; Fri,  1 Sep 2023 09:53:24 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68c0d886ea0so1537190b3a.2
        for <regressions@lists.linux.dev>; Fri, 01 Sep 2023 02:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693562004; x=1694166804; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVmIC/TSva2BQpG1ymilUgrZHBLPn2XzYNzkcuE+VkA=;
        b=VrDnWhzMNIgi7URbDXmo4DPXjKWLHlldWduefStFbgluA+8c0eFE2Truz0yRKJ50Q6
         d16EpFOGgZV9UGS91qwqoSZ990HGwNlANKhyKEsSeT7SCr+56vNnttmZcG7aIq6wExuA
         ldiSQG5mGoSYVz8ndipPNeMi1+Oe1p7Jkc4xNJCWkvgBRyZf1bPjCVY6skpkV3mAt/He
         DfjGktJMWIMy9RoZve41KAJ2wCv5KHafISSWZxVDiokB4lP+NkSouo1INWqWi5pM9uB+
         jHdVnXoFyTOYsQ3jQvgirVR7ufvm/OfcGSLPScECmxAW7ovfcYHtXGE/JVcqlr4opcIh
         uMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693562004; x=1694166804;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVmIC/TSva2BQpG1ymilUgrZHBLPn2XzYNzkcuE+VkA=;
        b=Vml3tczZJ3GfVHOH+NJUICUB8cAtL9JNkCKlRZXD/J1C2QsgHttsvh9LfmnFdCoqLR
         vu/JlJyn2lf7Jca1ivIu1lf9B04MewNPwPLSYxQNOYNRXflB1Uf2llapsHUtGBpXkpVe
         K3A7r2MQ3J0AXZFFPalvbDTkkyYD72Qua4iQrqXauGZy0Y5fIzC0ZjhqWMx5Yp1eCx/I
         zrqaUNDp/8i/AV3IVmiuZ8fWvJaY9IXrZqPUusCDvCviLsm3R4lQkQ/yO9nsrZAnh81a
         LosCf6zzGmNhjl628LXZvlBeywail7WhD5Um16Lxl4Hnh+illSM2SFMrwu5oRtviXe+7
         b2Uw==
X-Gm-Message-State: AOJu0YzcgSZ3nHUrE+UzUfGUYRkVN8qXh59Ysb5Be++m/hC7s9iCWFDi
	o/vJNdG9duH+7NcX/UQfK6pc+2hKUR4=
X-Google-Smtp-Source: AGHT+IH04Xqgdy+iVpdudRptAkZMoVyRlGpsdKljBL/aNZUf6YH08brsR289r+m531UrzzXYgojxug==
X-Received: by 2002:a05:6a21:788e:b0:132:2f7d:29ca with SMTP id bf14-20020a056a21788e00b001322f7d29camr2634863pzc.24.1693562003644;
        Fri, 01 Sep 2023 02:53:23 -0700 (PDT)
Received: from [192.168.0.105] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id u18-20020aa78392000000b0068c6e666066sm2613068pfm.111.2023.09.01.02.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 02:53:23 -0700 (PDT)
Message-ID: <705ce5be-93a7-d41c-a557-47090535f089@gmail.com>
Date: Fri, 1 Sep 2023 16:53:17 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Miklos Szeredi <mszeredi@redhat.com>, Amir Goldstein
 <amir73il@gmail.com>, Ruiwen Zhao <ruiwen@google.com>
Cc: Linux unionfs/overlayfs <linux-unionfs@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: overlayfs: cannot rename symlink if lower filesystem is FUSE/NFS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Hi, 
> 
> We recently found a regression on linux kernel: rename(2) on a symlink through an overlayfs fails with ENXIO, when the lowerdir is FUSE.
> 
> *What happened*
> 
> When running `mv` command on a symlink file through overlayfs, and the overlayfs's lowdir on FUSE or NFS, the command fails with "No such device or address". This issue happens on kernel 5.15 and 6.1, but not on 5.10. 
> 
> *How to reproduce*
> Environment: Debian bookworm (kernel 6.1.0)
> 
> 1. To prepare the FUSE fs, create a file and a symlink under the VM's root dir:
> 
> ```
> ruiwen@instance-1:/tmp$ ls / -l | grep foo
> -rw-r--r--   1 root root     0 Aug 30 23:10 foo
> lrwxrwxrwx   1 root root     3 Aug 30 23:12 foolink -> foo
> ```
> and then run libfuse's passthrough (https://github.com/libfuse/libfuse/blob/master/example/passthrough.c), which mounts a FUSE filesystem by mirroring the root dir:
> 
> ```
> ruiwen@instance-1:~/fuse-3.16.1/build/example$ ./passthrough -o allow_other /tmp/fusemount
> ruiwen@instance-1:~/fuse-3.16.1/build/example$ ls /tmp/fusemount/ -l | grep foo
> -rw-r--r--   1 root root     0 Aug 30 23:10 foo
> lrwxrwxrwx   1 root root     3 Aug 30 23:12 foolink -> foo
> ```
> 
> 2. Create an overlayfs mount, with lower dir being the the mount point of FUSE filesystem.
> ```
> ruiwen@instance-1:/tmp$ mkdir -p fusemount upper work merged
> ruiwen@instance-1:/tmp$ sudo mount -t overlay overlay -o lowerdir=fusemount,upperdir=upper,workdir=work merged
> ruiwen@instance-1:/tmp$ ls -l merged/ | grep foo
> -rw-r--r--   1 root root     0 Aug 30 23:10 foo
> lrwxrwxrwx   1 root root     3 Aug 30 23:12 foolink -> foo
> ```
> 
> 3. Try to move the symlink and see the failure:
> ```
> ruiwen@instance-1:/tmp$ mv merged/foolink merged/foolink2
> mv: cannot move 'merged/foolink' to 'merged/foolink2': No such device or address
> ```
> 
> 
> *Some observations*
> 
> 1. Same bug has been reported at Debian Bug, where overlayfs is used with NFS: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1049885. This makes me think that the bug is more on overlayfs, but not on FUSE or NFS.
> 
> 2. This issue can be reproduced on kernel 5.15, 6.10, but CANNOT be reproduced on kernel 5.10. There is a noticeable change on 5.15 that is related to overlayfs: (https://github.com/torvalds/linux/commit/72db82115d2bdfbfba8b15a92d91872cfe1b40c6), which introduces copyup fileattr.
> 
> 3. When reproducing this bug, we found that the error ENXIO was actually from getting lower fileattr. In dmesg we see: "failed to retrieve lower fileattr (/link, err=-6)". So it seems that overlayfs for some reason fails to get the file attributes of the source file from the underlying filesystem.

See Bugzilla for the full thread.

Anyway, I'm adding it to regzbot:

#regzbot introduced: v5.10..v6.1 https://bugzilla.kernel.org/show_bug.cgi?id=217850
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=217850

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217850

-- 
An old man doll... just what I always wanted! - Clara
