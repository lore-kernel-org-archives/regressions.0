Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012AD63A0
	for <regressions@lists.linux.dev>; Thu, 13 Jul 2023 08:03:57 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-c581c758ad8so385098276.1
        for <regressions@lists.linux.dev>; Thu, 13 Jul 2023 01:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689235437; x=1691827437;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bNc2pUv/smaIGLoP8Kp1HP8/RcjfUJ9VWG1zvqf1FRk=;
        b=QdNGjNEI4hzaUyyE7vA5jRRLDwnHf/GBv2mvnGl9QudbJavTc5uLYF02AL2EE4BzOY
         STJJ2WGhIp2Fj8EMNEvxDDHfng6gZdIXBdrrHsjH2AXUahTVjn0HAkJXLW3iGC75PBLu
         CCabxflcCi9dpDpQe/n8cMzpdtO050gJRBQ2Uz9t/RweW6YMIvHKiM4KncWLJJXBamIx
         M/8b/KV1EDS6ycM+QiKEdGAAOtbCrPD8dSxBsUfI1VmwNrpIfgomMXGr6fHRwxUZWOCP
         szf0JVZch8WuZdHHJoeCnFQe0ouytx44u4mdl/kmN2fiKqmfpynMk1nY3QJl5+lvbfNl
         I6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689235437; x=1691827437;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bNc2pUv/smaIGLoP8Kp1HP8/RcjfUJ9VWG1zvqf1FRk=;
        b=P3YAZj8c7iT+vVoKZBt35WAE45TGibUjk6f+mHOo3xO19Zcznh1Xh2ulUbXprrTO3P
         ck22Dgo/mrGviqTqE9X/9k5kxfl7O1X73GD+Nx6nB1AmQCfvT/VcXSqqATPGC7lK5nZI
         XcoHhxBRpy1Bn5Zy01TdChtDWG5dFmAQ/9eiQ/DD8ErtcNayijXRUPXqXEi+aOzNoa4a
         jflv7Ije4hrdUKAl1sPl/vKtv20w7OGttYBl7opGu5FTEkDHGRRqmgKV+NZOxdF3pI+T
         +1dCUUXcJ1eqd6tQepX9OrJMSRfzk9t7Pl4N8+DvKbAdtQara8s4EQk6IO3Eh2zGO+Xk
         eAVg==
X-Gm-Message-State: ABy/qLbHMSbYL4G4uac/LGsrBTy5zad/Fb2XQePCZsZVDObBQvI1K3PE
	K95F6kL12ayI6+JF6Wcb2Idbax15UgAL1r7H4eB9K6yvUlc=
X-Google-Smtp-Source: APBJJlEs/BW2S7clrV46fvJmu+3eBnO23VlcwbByQILp+Uk/fVxad+/5Pb3wy3N9QjZoKwP16JnEceQCL1lv6YjGNYs=
X-Received: by 2002:a5b:7c6:0:b0:bcb:523e:addf with SMTP id
 t6-20020a5b07c6000000b00bcb523eaddfmr622445ybq.65.1689235436627; Thu, 13 Jul
 2023 01:03:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Date: Thu, 13 Jul 2023 10:03:45 +0200
Message-ID: <CAAUqJDuRkHE8fPgZJGaKjUjd3QfGwzfumuJBmStPqBhubxyk_A@mail.gmail.com>
Subject: Another regression in the af_alg series (s390x-specific)
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, regressions@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

It turns out that beneath the first bug [1] there was another one
hiding. It seems to happen only on the s390x architecture when running
the following libkcapi [2] reproducer:

kcapi -x 2 -s -c "gcm(aes)" -i 0d92aa861746b324f20ee6b7 \
    -k f4a6a5e5f2066f6dd9ec6fc5169c29043560ef595c9e81e76f42d29212cc581c \
    -a "" -t 5f24c68cbe6f32c29652442bf5d483ad -q ""

Frequently (but not always) it triggers an oops like this one:

[ 3986.766763] Unable to handle kernel pointer dereference in virtual
kernel address space
[ 3986.766774] Failing address: 0000000a00000000 TEID: 0000000a00000803
[ 3986.766776] Fault in home space mode while using kernel ASCE.
[ 3986.766778] AS:00000000a43a0007 R3:0000000000000024
[ 3986.766825] Oops: 003b ilc:2 [#1] SMP
<snip>
[ 3986.766877] CPU: 0 PID: 271064 Comm: kcapi Tainted: G        W
    6.5.0-rc1 #1
[ 3986.767070] Hardware name: IBM 8561 LT1 400 (z/VM 7.2.0)
<snip>
[ 3986.767151] Call Trace:
[ 3986.767153]  [<000003ff7fc3d47e>] gcm_walk_start+0x16/0x28 [aes_s390]
[ 3986.767160]  [<00000000a2a342f2>] crypto_aead_decrypt+0x9a/0xb8
[ 3986.767166]  [<00000000a2a60888>] aead_recvmsg+0x478/0x698
[ 3986.767169]  [<00000000a2e519a0>] sock_recvmsg+0x70/0xb0
[ 3986.767175]  [<00000000a2e51a56>] sock_read_iter+0x76/0xa0
[ 3986.767177]  [<00000000a273e066>] vfs_read+0x26e/0x2a8
[ 3986.767182]  [<00000000a273e8c4>] ksys_read+0xbc/0x100
[ 3986.767184]  [<00000000a311d808>] __do_syscall+0x1d0/0x1f8
[ 3986.767189]  [<00000000a312ff30>] system_call+0x70/0x98
[ 3986.767193] Last Breaking-Event-Address:
[ 3986.767193]  [<000003ff7fc3e6b4>] gcm_aes_crypt+0x104/0xa68 [aes_s390]
[ 3986.767198] Kernel panic - not syncing: Fatal exception: panic_on_oops

This time the regression was bisected to:

commit c1abe6f570aff4b6d396dc551e60570d2f50bd79
Author: David Howells <dhowells@redhat.com>
Date:   Tue Jun 6 14:08:52 2023 +0100

   crypto: af_alg: Use extract_iter_to_sg() to create scatterlists

I can't see what the problem is with the commit, so I'm reporting here
hoping that David or someone else can pick it up from here.

Cheers,
Ondrej

[1] https://lore.kernel.org/linux-crypto/CAAUqJDvFuvms55Td1c=XKv6epfRnnP78438nZQ-JKyuCptGBiQ@mail.gmail.com/T/
[2] https://github.com/smuellerDD/libkcapi/
