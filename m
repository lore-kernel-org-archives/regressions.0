Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680D140FD9B
	for <regressions@lists.linux.dev>; Thu,  8 Oct 2026 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459334; cv=pass; b=JNqbNGrj0PBCnB/f/Yqx787WKDCVHkqUaf9s10Q8odEmQ3gbYmqPlgngBqVLv8ZSMn3cpJe8eOBIbDUFrOI6uhGnfa0vgqqUsjuHvtV1vpqMJ9xcKNYWOEwdqNPcmiSEQXbul3hh0RSiYTVAVH/NoDFVYb1/GStG0NDx2cZMVjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459334; c=relaxed/simple;
	bh=qwS80d1Sq3GZmTtrcuSn4QH3WH9VVgg1Y27sZBwjsZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bN5fAnv2NIU9by3lRR3nyqqkAZGB+cUAN3tTyXnqalTweRZNdol3kuvccUNTp+oJn5zq7NUPzf93knEEy9t6X0gODPf2zuzajD6GkAGa0X5AehuFCX9Ih23iFm+0CGZVwT1Uj0G4VQKPfcUo2MRyC3xTvnRIaVdNHMROvrQYq6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=ghMr36cT; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="ghMr36cT"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2db80fcdf8bso21639615ad.2
        for <regressions@lists.linux.dev>; Thu, 08 Oct 2026 04:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791459333; cv=none;
        d=google.com; s=arc-20260327;
        b=IcM9Nj/2cMikbamYbF40/O1nfXhSHhV+nIRxIightpqe9hKNwiaoRYbwCt4msqINuL
         V4XaMlDNYDS0/f8uKc+DBnme7I92MolLJy3S49vFTVNqEHB0sfDqR/7iTHgSts+9qRRU
         RqqF4c6j6HfZsBsrY8SQnMOPJlDoBtsbQXwpw+Bw93KMWvECzet98ddI2H/YL29qFhP3
         /rSrJ9jCMUyQ1ZvGQ9P0pGU7k6zXz/I9tKEr4b3LJUsahjvNfgabf1c6C1l6mQf5R6Vu
         xIfIPMl0/JZ7CTCaMu9s3yMW+kD/SzdsCIs6sTetLRNrw3BVcHShXCd/h/4W+w71ERRp
         gYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WJ0j6cOAzgWtBhqKOpMaIaa9HpzVeoPjmiPtw080gpM=;
        fh=Ln4JkRUlUrEd/Hm6SExzP7wIUxI8ihAtn6LYPKa/Ukc=;
        b=Wzz+d+jJlWLCzkngi4WGpNJfgGzfcnVgsBobFZmwhf/QKYo0Xal/+XAgDmWV6/L3/u
         AJ4A4gEKJ+VMHFXtd0ZJQ7QdEZDKvRl60QmCeCvZwXinr8yVWeSsgiMuRnZQh1ClbdHy
         sPLicVvLJDRLv09pjAZ76mnAKqqkO5bzkDA4svQGipETyE44ZbIIce9jlV69oUb2ZfLS
         a68CQkiuClMb+Ygwvr8NMb3TPPqH31MEHGGL67xiElKekeqtScdD/XiqYVyFHov/c9KB
         vKKthLd2H5QoOB7+FFkDun9xSgBxxRKrOMNH5fgkE00Uz4szf5LfyN21Vm6sYLSSqiZI
         sCkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1791459333; x=1792064133; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJ0j6cOAzgWtBhqKOpMaIaa9HpzVeoPjmiPtw080gpM=;
        b=ghMr36cTOC/Ip7xHhC8vhHJpJXl2ZMHT9d3KhKMpcgpqIJ36DDqq6EqbzPw8u+2goD
         h88Q0nbw/LP2qjYw2nGhvFQV/uDLi5yF0ahu+baMG71uT+zYl5UmOLf1qm3w1fgqIGkO
         ND10xB3+FybhIyfAkYpj9cUPVSgNYHN+5CX23mn/MPuypuP7Th+yJ7xszd7TQ0xzTW0l
         voDYVe2mOvcrLiPdizZuZfropWfsmdxoadJDSOA4RmRW8fN7d6rtG+e66DrFuyfHmdys
         tLgH0rGIjl8QZzCHH0KKL3NhxfPbd3P3T6NzqNHUoOJVgCY0VMTz4HqdJOg99ZMge3Ft
         6INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791459333; x=1792064133;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WJ0j6cOAzgWtBhqKOpMaIaa9HpzVeoPjmiPtw080gpM=;
        b=K08LfRRyQ2c6uWa5r3TaGStHD4OHbews2gXQuvnaVi8Gsrgex0K7tbBbEizIuRxxK1
         zT76dtGZ0JWN2Ps7hkxOQagc9qV9DiAxVrquy3Lyx2BE0QIlJIeCqLGYm91ikMGnMc/X
         WOGnaejL/PMHBGYzYm90yCTsyPowEfNflM4OmS8oZKbRkW6tw44AfMGTzFroNihmqO82
         Iuws0bCYqyIUwHkYeHs6+6+21Ucz6OJkGgQMKXovH3TgdtAVb4/QExPKgVfRHGlstLIe
         Pr/GMkEXkOQIywS8Jo20udmaSM81K0wK0NKff9XGjQLTXRU/uTfgLegPdP5aWABh8hB0
         W5Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxfbbxCClSUSkbKrrIJwGSACRJItw6DnvM9AtNAJUM+pn8o2QyX4mZN5qLWv7+IdqwVYrZi0YlpbIalyQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJun3BLUoeOhq3cnsVo8Vx1tKdHH2e8BssjPBplsmABA/V9AxDG
	5bCWTorpPhDS/QdeOPhWIqtAOvjt1ImB9ZqdS+enpHHuZGsXzuKBmxG1Ys0Cf1sPSOnsStK0G9V
	T1bovIE+5Wjxbt5+1CCPkD2zpDYuuGgA7H6V3wjYERg==
X-Gm-Gg: AYBFou0MzR1olOrAAq6tEWcHiZEmGN6XYBrfHwjl1+cP+4SH5UtOthRdtS+WWDPR1j8
	JLkn8o9F4fhX+ZHs7bfqKv8VDqglrDmCyTGYOAZq0A8HWiCCgns5m1IGgaxMMBCxXHQaHdamHnR
	Mxhaw+KVENynKTMRymtxMFCFnH9WvfIbLFttR8xyRv+pUueAdAjtFsH2PvS3is2v1+rpm0x/Fvj
	AOHZdSwIMlFtgM8MV3tkAcNvjlXDRe6VDDPFXUpYQJf5ZxP8Zmr0bDWhtf6Ue3aIwTyt4UIwdIy
	nd3g3cfvXE7wg0VsRdiEj4FsMofuiXdiC4lIr3H//f5sOwM2eLgkQIeVi/hh8nBGT7QVA0sE8g5
	dK94STfWaUgLiJV0dA/8tx0jQcPMngnGosu1rMVYG1RPN4j14tf/sAu0bapygrcM007JHXRKnLF
	Y=
X-Received: by 2002:a17:902:f78f:b0:2e8:b51:a94a with SMTP id
 d9443c01a7336-2e80b51ab89mr14161265ad.60.1791459332533; Thu, 08 Oct 2026
 04:35:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPa5EdCj3v17tB-SF2JNecq5Q8s1Pranr-XzAFWNpNTBPgPG7w@mail.gmail.com>
 <a6193df2-98f3-409f-b73f-5b91835a0107@kernel.org> <CAL4WiirwF6bZwocErCthJ+TUu7wipRfSibRBoKWjjkA2nVSrqQ@mail.gmail.com>
 <CAL4WiiqSmW093PDngLrUNiNA5GVKeM3+tAO7KMDJeyjYZ7GRzg@mail.gmail.com> <4c98eff5-c8c7-43ee-b59a-adb833978816@kernel.org>
In-Reply-To: <4c98eff5-c8c7-43ee-b59a-adb833978816@kernel.org>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
Date: Thu, 8 Oct 2026 13:35:05 +0200
X-Gm-Features: AclHuK_tvli5e8RZKmXkQP-Qa8CuMz9cFdX9rYwTM6ujlWxZGIxES2B32YmtH_I
Message-ID: <CAPa5EdDk+HuVP0H1+iqOcHDHZnfdika5WOQcgSaMtfRFWzqZ+Q@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] r8169: TX stall with checksum offload on
 VLAN frames with inline tag (REORDER_HDR off) since 1517d1996b52
To: Eric Dumazet <edumazet@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, nic_swsd@realtek.com, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

On Wed, 7 Oct 2026 at 00:00, Eric Dumazet <edumazet@kernel.org> wrote:
> Note to testers:
>
> My LLM agreed with the change in vlan_dev_hard_header() (above), but said
> that no change was needed in vlan_dev_hard_start_xmit() (below)
>

I'll need the patch applied to 6.18.y for testing, as I can't test it
personally and I want to provide testers with the same kernel/system
version as before just with minimal changes. So do I understand
correctly that the patch below is what you want to get tested, no
changes in vlan_dev_hard_start_xmit()?

Regards,
Jan

diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
index 560521cf596e..67648152add8 100644
--- a/net/8021q/vlan_dev.c
+++ b/net/8021q/vlan_dev.c
@@ -49,42 +49,14 @@ static int vlan_dev_hard_header(struct sk_buff
*skb, struct net_device *dev,
                                unsigned int len)
 {
        struct vlan_dev_priv *vlan = vlan_dev_priv(dev);
-       struct vlan_hdr *vhdr;
-       unsigned int vhdrlen = 0;
-       u16 vlan_tci = 0;
-       int rc;
-
-       if (!(vlan->flags & VLAN_FLAG_REORDER_HDR)) {
-               vhdr = skb_push(skb, VLAN_HLEN);
-
-               vlan_tci = vlan->vlan_id;
-               vlan_tci |= vlan_dev_get_egress_qos_mask(dev, skb->priority);
-               vhdr->h_vlan_TCI = htons(vlan_tci);
-
-               /*
-                *  Set the protocol type. For a packet of type ETH_P_802_3/2 we
-                *  put the length in here instead.
-                */
-               if (type != ETH_P_802_3 && type != ETH_P_802_2)
-                       vhdr->h_vlan_encapsulated_proto = htons(type);
-               else
-                       vhdr->h_vlan_encapsulated_proto = htons(len);
-
-               skb->protocol = vlan->vlan_proto;
-               type = ntohs(vlan->vlan_proto);
-               vhdrlen = VLAN_HLEN;
-       }
+       struct net_device *real_dev = vlan->real_dev;

        /* Before delegating work to the lower layer, enter our MAC-address */
        if (saddr == NULL)
                saddr = dev->dev_addr;

        /* Now make the underlying real hard header */
-       dev = vlan->real_dev;
-       rc = dev_hard_header(skb, dev, type, daddr, saddr, len + vhdrlen);
-       if (rc > 0)
-               rc += vhdrlen;
-       return rc;
+       return dev_hard_header(skb, real_dev, type, daddr, saddr, len);
 }

 static inline netdev_tx_t vlan_netpoll_send_skb(struct vlan_dev_priv
*vlan, struct sk_buff *skb)
