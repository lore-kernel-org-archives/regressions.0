Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5395E423780
	for <regressions@lists.linux.dev>; Thu,  8 Oct 2026 22:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498631; cv=none; b=nyza8gaqrF+MCnxOgwqHXfkjyUQt6AgSeG4Wm+PbRPUAfEreQAN4O/l6xgqJ/6YADjMW6IOckHnBDFSh+u7c3/P5eoN92lXCr80DPTed2sGU8pW5a08zv46um0OwhD+fpcGgGAAO2kmguEswmM2HZaF4/GXPPdvrdtRQpJjoGtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498631; c=relaxed/simple;
	bh=DmpUgBe6WbGh4qoSebBnxDOEpRHy5UIKV6WDZGaQ/u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTajkzmyIjZPkda0RTkWEpLdoDBeJKfAgkKQRi2aAXUpnuaX9LX0m57VkqKyk9dW2yt5WiOjpdo21Q701eCljyvqmsLLXQ4xYDHVe8hvDFrg9+e857uWAD7IPvf8OGsTsMIcphj/mkYPwtVoZhSFTj5OLaONIwFMsbQUhrUCVI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/wNOgdW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/wNOgdW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C791F000FF
	for <regressions@lists.linux.dev>; Thu,  8 Oct 2026 22:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791498628;
	bh=YM3S3zdUrJPi9sjI7tUoLRuIpMCsX8cp9vpn2bmDzf4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=i/wNOgdWnPCqXFRTs+S1r4/ylt73USsPZmnZnpkFkbA7mbTx2LepLcSQxeCuJSux2
	 DbyK8bPyJ/jAUiceIIwPEReSuKkr6gy8zSil9BD8o8e/+4uJSIxRmA9UFHVEMNjg9m
	 gm+ovsc9+vDKVyrwk3be/DF6whp0UwFY/f6fVE4k1v+BRan9VELmTIElHUimQRs8kn
	 DBk1l+Q0tFQ62OqAP7NEfYL0l1fMSAWU/t89uICUFzoh/J6eQsP/0hPqFVsumvptg4
	 4o58ulrTEKoDWfUwamUnhS8yvo91troGSZZhgbe6lPyqcw4AB2CllvSlOSS712feIO
	 dRbs8uWKx+zHg==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6de08b2e447so1558134eaf.3
        for <regressions@lists.linux.dev>; Thu, 08 Oct 2026 15:30:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByA6JJUv1RzdfsF43H4S+DZ/dCrz3lFMKDr06NP7SLOmpByDe8Ep7wN+37IQdBzPMSujCjLGJQ0tqdyxw==@lists.linux.dev
X-Gm-Message-State: AFuF++mL7W+yClWfi4voKYp2T3wJ07TvsI80BfhvwrqlChFBLG/E6bBt
	6/1OwG/DqRGKxEN4U6VJY8++T2H+YWWgLgaW4uYn2bQ/96oXdjjrSliRlwwQ1pEICpA4druFx88
	VExQrQ8j7UtugflpG2LbjwU45TIAF/oE=
X-Received: by 2002:a4a:e915:0:b0:6dd:696d:b21f with SMTP id
 006d021491bc7-6ef08e71c1emr165604eaf.2.1791498628179; Thu, 08 Oct 2026
 15:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPa5EdCj3v17tB-SF2JNecq5Q8s1Pranr-XzAFWNpNTBPgPG7w@mail.gmail.com>
 <a6193df2-98f3-409f-b73f-5b91835a0107@kernel.org> <CAL4WiirwF6bZwocErCthJ+TUu7wipRfSibRBoKWjjkA2nVSrqQ@mail.gmail.com>
 <CAL4WiiqSmW093PDngLrUNiNA5GVKeM3+tAO7KMDJeyjYZ7GRzg@mail.gmail.com>
 <4c98eff5-c8c7-43ee-b59a-adb833978816@kernel.org> <CAPa5EdDk+HuVP0H1+iqOcHDHZnfdika5WOQcgSaMtfRFWzqZ+Q@mail.gmail.com>
 <CAL4WiipSpufpdo-AWoNEJta-puLQ5hMyPn2xcjwg4vg67PNoyA@mail.gmail.com> <CAPa5EdC5+JiLCHdCt4m-sqM1pUs=fG8T7zsmVcheHCG8FFF8Fg@mail.gmail.com>
In-Reply-To: <CAPa5EdC5+JiLCHdCt4m-sqM1pUs=fG8T7zsmVcheHCG8FFF8Fg@mail.gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Fri, 9 Oct 2026 00:30:15 +0200
X-Gmail-Original-Message-ID: <CAL4Wiirc10c4_NHznYYU9ODeEO0Fh8WJm72Kk8M6xZ5rXG489g@mail.gmail.com>
X-Gm-Features: AclHuK83ylPpO1Omc3aUuPZqI6xRPqm0TMlzXP99sIQGhVnJEjvR3bpixOY5QaA
Message-ID: <CAL4Wiirc10c4_NHznYYU9ODeEO0Fh8WJm72Kk8M6xZ5rXG489g@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] r8169: TX stall with checksum offload on
 VLAN frames with inline tag (REORDER_HDR off) since 1517d1996b52
To: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, nic_swsd@realtek.com, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 8 oct. 2026 =C3=A0 15:48, Jan =C4=8Cerm=C3=A1k <sairon@sairon.cz> a=
 =C3=A9crit :
>
> On Thu, 8 Oct 2026 at 14:48, Eric Dumazet <edumazet@kernel.org> wrote:
> > This is the current patch under review :
> > https://lore.kernel.org/netdev/20261008123812.554729-1-edumazet@kernel.=
org/T/#u
> >
> > Thanks.
>
> Oh, I missed that, as GitHub "protected my privacy" and I ended up in
> CC with its noreply address (which really leads to /dev/null). I've
> applied that patch to our tree and started the build, I'll ask in the
> issue tracker for testing once the build finishes and reply in the
> patch thread if I get any feedback.
>
> I've disabled the "privacy protection" on GitHub so I hope next time
> it shouldn't happen - but just in case you'll be updating the patch,
> please use my real address I use here.

Sure!

It seems a V3 will be needed, I will send it for review tomorrow after
the 24 hour delay

diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
index c949c6a829456c2f75d6c514b35a85ff64c493d8..684820c772289f1b73aa01255cc=
9ae5fadae95a9
100644
--- a/net/8021q/vlan_dev.c
+++ b/net/8021q/vlan_dev.c
@@ -110,6 +110,8 @@ static netdev_tx_t vlan_dev_hard_start_xmit(struct
sk_buff *skb,
        unsigned int len;
        int ret;

+       len =3D skb->len;
+
        /* Handle non-VLAN frames if they are sent to us, for example by DH=
CP.
         *
         * NOTE: THIS ASSUMES DIX ETHERNET, SPECIFICALLY NOT SUPPORTING
@@ -121,10 +123,34 @@ static netdev_tx_t
vlan_dev_hard_start_xmit(struct sk_buff *skb,
                vlan_tci =3D vlan->vlan_id;
                vlan_tci |=3D vlan_dev_get_egress_qos_mask(dev, skb->priori=
ty);
                __vlan_hwaccel_put_tag(skb, vlan->vlan_proto, vlan_tci);
+       } else if (skb->len >=3D VLAN_ETH_HLEN + sizeof(__be16) &&
+                  !skb_shared(skb) &&
+                  vlan_hw_offload_capable(READ_ONCE(vlan->real_dev->featur=
es),
+                                          vlan->vlan_proto)) {
+               u16 vlan_tci;
+
+               /* The frame carries its outer tag in-band, either inserted
+                * by vlan_dev_hard_header() or provided by the sender.
+                * Let the real device insert it: some NICs can not offload
+                * checksum or TSO for frames carrying an in-band tag.
+                * Not all ndo_start_xmit() callers set the mac header.
+                * vlan_set_encap_proto() may read two bytes after the vlan
+                * header, so shorter frames are sent unchanged, as are
+                * shared skbs (e.g. from pktgen).
+                * On allocation failure, drop the frame rather than handin=
g
+                * it to the real device with an in-band tag.
+                */
+               skb_reset_mac_header(skb);
+               if (unlikely(!pskb_may_pull(skb, VLAN_ETH_HLEN +
sizeof(__be16)) ||
+                            __skb_vlan_pop(skb, &vlan_tci))) {
+                       kfree_skb(skb);
+                       this_cpu_inc(vlan->vlan_pcpu_stats->tx_dropped);
+                       return NETDEV_TX_OK;
+               }
+               __vlan_hwaccel_put_tag(skb, vlan->vlan_proto, vlan_tci);
        }

        skb->dev =3D vlan->real_dev;
-       len =3D skb->len;
        if (unlikely(netpoll_tx_running(dev)))
                return vlan_netpoll_send_skb(vlan, skb);
