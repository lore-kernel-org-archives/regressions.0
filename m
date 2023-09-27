Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE06D1A586
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 19:56:05 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-65b2463d651so25905756d6.3
        for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 12:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695844565; x=1696449365; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5A+e538uMQ9k/uzyhmViIJnbml3dasNee8PoGBFz6DE=;
        b=iBFyp5XI5/6jhVZJpa1qEp2ODCBXbz/okkxojwPE497epz6NOMfzh/kCjfHji39Yoi
         rSxyqjJuYXCnm0m/XnajC44ie6J9Fz8yWn1rdTTPTOV2+x8A3Luzc/ynVlpJjfNkEHY0
         l4vLQv/9yKzbTkUS7tVBRUOSK0MYxUmis226gHUim3+NSc7LWICtI2YgCR7+CyBTyuZh
         EZpgQHNXQrFQWMQR5KusoPvWm5PNmdcYVIouCUwdDzjNuz1MNGqVieRgQ5BZLaWEJ31I
         IUpmBpSlY55AoUf8HOQRFudGq9tcBTs7hkI2M+nxyRtjgcxprhZCS7jQ2W8nhP6zfz7T
         AVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695844565; x=1696449365;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5A+e538uMQ9k/uzyhmViIJnbml3dasNee8PoGBFz6DE=;
        b=gaKATBWxEz6TV5Ko4FadUvDFmBRBgExx3dKsNj9dqsAm5n3I2IpNxEXm3o75yjRNXF
         vwHx6CX+hTpgzX6iIDT73dqmDyzORAxfHZQSaHISYdbLwoGcA5uMgxkcweZa1bBs76gT
         xpVVtSUmhVSGrmnK8b8ayHWIbSdtwkXIpVLF2H9Dx3//cCJtuwaavvGV1hUSfAzEoLR0
         5DdiroXGVs2tm5B/2ROtcro6844ohBNCK5WOAXdx4/0pXjvsl5ikI0MO1pqbK24ivHsS
         soFTvlUUP6AzX1WBu3MDWqPIXsYkhUYppWK0AWYe/nVZcmSEM5dcvWbf3G+1I9FO1tDz
         /uAw==
X-Gm-Message-State: AOJu0Yz91EGqK0UdgwyD4F9vOBiuN1uU2v0cMiK2F0lBEa3s/yu8lRxt
	KtPFOBtSTub+WOk4i84GSnqc6kdOdftgqVq9l1yWfwKe1ZqrRU2D
X-Google-Smtp-Source: AGHT+IGHzPPg4FYPmcv6LpEYvSLXtkhXZXZ6WSl/my37BuK9tBvcubscOLBy5wWBmJcEfgA2qADHhdeBIf2VV86idc8=
X-Received: by 2002:a0c:e4c9:0:b0:656:34c5:13b9 with SMTP id
 g9-20020a0ce4c9000000b0065634c513b9mr3489700qvm.34.1695844564830; Wed, 27 Sep
 2023 12:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Simon Kaegi <simon.kaegi@gmail.com>
Date: Wed, 27 Sep 2023 15:55:49 -0400
Message-ID: <CACW2H-5W6KE6UJ8HwD6r9pOx4Ow_W6ACZyg9LpTykjU6tHHB3g@mail.gmail.com>
Subject: [REGRESSION] EINVAL with mount in selinux_set_mnt_opts when mounting
 in a guest vm with selinux disabled
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, dhowells@redhat.com, 
	jpiotrowski@linux.microsoft.com, jlayton@kernel.org, brauner@kernel.org, 
	sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced v6.1.52..v6.1.53
#regzbot introduced: ed134f284b4ed85a70d5f760ed0686e3cd555f9b

We hit this regression when updating our guest vm kernel from 6.1.52 to
6.1.53 -- bisecting this problem was introduced
in ed134f284b4ed85a70d5f760ed0686e3cd555f9b -- vfs, security: Fix automount
superblock LSM init problem, preventing NFS sb sharing --
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.1.53&id=ed134f284b4ed85a70d5f760ed0686e3cd555f9b

We're getting an EINVAL in `selinux_set_mnt_opts` in
`security/selinux/hooks.c` when mounting a folder in a guest VM where
selinux is disabled. We're mounting from another folder that we suspect has
selinux labels set from the host. The EINVAL is getting set in the
following block...
```
if (!selinux_initialized(&selinux_state)) {
        if (!opts) {
                /* Defer initialization until selinux_complete_init,
                        after the initial policy is loaded and the security
                        server is ready to handle calls. */
                goto out;
        }
        rc = -EINVAL;
        pr_warn("SELinux: Unable to set superblock options "
                "before the security server is initialized\n");
        goto out;
}
```
We can reproduce 100% of the time but don't currently have a simple
reproducer as the problem was found in our build service which uses
kata-containers (with cloud-hypervisor and rootfs mounted via virtio-blk).

We have not checked the mainline as we currently are tied to 6.1.x.

-Simon
