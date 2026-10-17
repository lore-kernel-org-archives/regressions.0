Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56017440A1F
	for <regressions@lists.linux.dev>; Sat, 17 Oct 2026 23:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792278905; cv=pass; b=eYhKHCB04y2WBniAkDLuEx/JmkYH+MydKUswWb3pQvEzVgloVQHKzv6crxdhL9ps3+DtT14Fnzlt5SrI9KesiJwdIBZQ4HA3WooXAFTCT6Le5imc3wKetgZQIv7jwfobT2frUQJVU7Ur26fuJrc+XNA8zrjKBSvcFBlKDDbXYvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792278905; c=relaxed/simple;
	bh=JGQQmMQk+YHEshO35FLCYdVBSknCjMwyLuG8a1XtJms=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Mwhqm8aRTD9H6ld8eZTRKQJ+FnPRLziROu0k8p2eGp9TKM1ztM0YyGpPZeq8CgcUK/wOGv22r9RISjkQwevHG44NBtFGjU3zqAXXdg23lz+yayqjwGjikLg4/kodqRZjXME4qrCgPY03VEoKnCZQwpS14bwCXxLhJrrtZ3YTrOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPvf0D3v; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPvf0D3v"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso898682e87.3
        for <regressions@lists.linux.dev>; Sat, 17 Oct 2026 16:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792278902; cv=none;
        d=google.com; s=arc-20260327;
        b=GzyUJGde3nh8TQeoP2R9cV6okgScvdZO6M40aNt0DtJM0oSiGa7iqeUb6YqkXes8+s
         LVEskvgFbja/viIcEb1oASquIX2ejGE2sHoEkG7H5r9vsm48cb9Z1c2VwEXxn9le5HBr
         HXeQ5+Dfl7ifBdkwtbQFBCp4QWS0yS/9C/WaSZWvJqdNSuO7YH3PGYgeA/waS/L9JcGE
         Non23NowuEaNlT2DlmLjEAJhuC+k4I+PXQxE2moNs9xJMZ2aYnQ6AyKkDVB0pBquP0t9
         9K4F6XmU5kWMTXCE5vT9HjgTG1n0nmsKuzZXMJgP1+Yjh7xNgXIwkI/LxwFlDLpydj0/
         HKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=dY5KKzZAmeU+yEfKm82zl3nVnOMZXYX8gp/zRSW1kMs=;
        fh=nzVUsRz+iFX+dMemadMV+jyI8wfXZQM0p+lOzFIi6UM=;
        b=NJEKI0UimlaxDhmBzziIcrpjq8MiPv6RSZl4G++MY1q1QKy6lQgyA1bdW3BX0KG4qt
         WTYlMleRw4H4eFb93oZkEIv3qy0l/kztwybT0nUO42cpwnn5TJRBSH8WkJiA1kJ+t/rl
         lrnV7vp1xLAJ0ioZw2mkCwKIvzvVgmP7ZNC1DRwSxzQFQ90vffQrKfev6Mc+v56vfFzo
         l2pX3sBV6+FGkJn29p2Z07VUNyjWoMtrVblmcCU3vK0nUAHE0YZ+tsvkVvAoAnHGZ8pI
         D4FuowJUjGn0+lcUImFjyQKcjxbXtx3BlIg/gXwCKRQxLe5p0wnsSiUEVwB3DxSXgOiM
         S+gQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792278902; x=1792883702; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dY5KKzZAmeU+yEfKm82zl3nVnOMZXYX8gp/zRSW1kMs=;
        b=EPvf0D3vjrhI5wi0KGpXz+xc1K1ZEO8JBh+x0SefQHfxdehqpe2bXt0f21yWzW2G9d
         cJM/nckfiK+aT5qsVZlcezwCqYyi9IDd6KuzoyTTGiNRZPMnzHIkEXJ9kxF9cCTgAO2s
         /X4J8KsDh6bIq534QtzmVWj+TEQvWSesuPOklyPHysOK8JO5dwLuamgwj77evzh+Kh4B
         kP0G3pztLFLtCzxYbwc1diYgm54eKTgXOOekeD25Amc7xrPQWP0JN74WaFXMJRlhj0ui
         uqoohTEPvg253CBIvXs3qx3ww3yJvjT5/MdE7sn/jdfvXg/KlF7SEqO00QWTYMwIg/d+
         qULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792278902; x=1792883702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dY5KKzZAmeU+yEfKm82zl3nVnOMZXYX8gp/zRSW1kMs=;
        b=2BgTHnn/xviSpAIlLPbcFcsW8M23icBKNkMcyseDTHug/DgcfNKAGKuFiU/GVj0HK8
         DhTYV8jQfLS94fUSKGRnX9Gdtrpiu1VfDMir5pXH9hdAUSd4xkrYy4r7IlgzXr+KWAXG
         f+Kj6W7WyqtNFgN9rWojBc2/y8/1WvN+fLV4ayyfV2/4MtF0FvZvvWeoBRnm7QwZ38bI
         kTB/kMdE/Rm32lQh0j4QXFLsvp3ifOQwJjb4QaNHhqDBi479Aq6CR4M8aSt4uiPjvAjW
         2jnUjWTCNHdQ/ydcWgSb2/KVs3htOk7qIRoOQGDdJPQprEF8w4c6g6kqgMfCKhlLq0pV
         M0pg==
X-Forwarded-Encrypted: i=1; AKwUvBy0+Po6dVX0/iOcYsKohzWjrUZ7yByjr8Kxj00BxMgHy89FR4UIrFhGgbX+5/h1Qfxqqs/GzQPno2WFkQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLPYsvJWbzqLqKFE46b0G6bKCAUwp6N2PMPxUTQAp4kiBvGFrZT
	oJNHeCe0WZz6LoazeVVzH+hB9AKwh/ecrQeBAJjt4dlr/3soxFFNIT4joCA0/kRV94hRZSTzdSW
	BaIPLPi6Ilz3LD7MS0bNLsJPzer3Y6Y4=
X-Gm-Gg: AYBFou1o55zSFMoQzjpQxef9yQbGE+Clc7AKAco5EdxE3H5TGiPHmDVN/TKRRcgNgX8
	afKPgNNBgLbZZkjQmc/bCZIhYkjwTOo2wYhnPTIMrZSoCrHIJruSBEr4WQz3FzKw9j8Hwu8Xzs4
	p5hNCeq7B0gfMx9I/nP07phpR4KlOZxE4cAzWdI+r+R3jy+pRdCv0NP9MnHMGRars32ne2VrJny
	NWsLEsppPis+IhMJxvjAiLPwgBkhsaNMBP2FYABE/Qe+IXxRkph0grcQ1ab3jf/Yfdbc+0JvVXo
	0McWOtktTiQTnHiqg9jAFNb8iKjowr8pOiFnZr/rm2kjhNOtRt/PaEAtMZOvAxUrDlxzB1XsW5E
	OY19uTVY1McSfVw==
X-Received: by 2002:a05:6512:33ca:b0:5be:4d3b:11be with SMTP id
 2adb3069b0e04-5be50a47285mr1122227e87.19.1792278901939; Sat, 17 Oct 2026
 16:15:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?TG/Dr2MgS0FTU0VM?= <loic.kassel@gmail.com>
Date: Sun, 18 Oct 2026 01:14:50 +0200
X-Gm-Features: AclHuK9r5oP2EYX1cff49GE63bI8TeJDT_Yf62YbwB9bIK0KxMojdwbJc5md3GY
Message-ID: <CAAzpgGfrHpQZQ8iaH5fqZHzk5tTx39+jGvGkVXxhYFkp-A_bQg@mail.gmail.com>
Subject: [REGRESSION] mac80211_hwsim: CCMP frames dropped on fast-xmit
 (WARNING in ccmp_encrypt_skb, net/mac80211/wpa.c:462)
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Sai Pratyusha Magam <sai.magam@oss.qualcomm.com>, Rohan Dutta <quic_drohan@quicinc.com>, 
	linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Since 7.1, with mac80211_hwsim in AP mode and WPA2-CCMP, frames that
the AP forwards from another interface (bridge) to an associated
station are dropped, with a WARNING per frame:

  WARNING: net/mac80211/wpa.c:462 at
ccmp_encrypt_skb.isra.0+0x240/0x260 [mac80211]
  Call Trace:
   ieee80211_crypto_ccmp_encrypt+0x40/0x70 [mac80211]
   ieee80211_encrypt_tx_skb+0xcf/0x180 [mac80211]
   mac80211_hwsim_tx+0x678/0xa50 [mac80211_hwsim]
   ieee80211_hwsim_wake_tx_queue+0x47/0x90 [mac80211_hwsim]
   ieee80211_queue_skb+0x227/0x420 [mac80211]
   __ieee80211_xmit_fast+0x24f/0x370 [mac80211]
   ieee80211_xmit_fast+0x149/0x230 [mac80211]
   __ieee80211_subif_start_xmit+0x15a/0x2e0 [mac80211]
   ieee80211_subif_start_xmit+0x49/0x1a0 [mac80211]

Environment: Fedora 44, kernel 7.2.11-200.fc44.x86_64, hostapd 2.10
and wpa_supplicant 2.10 (Alpine), radios created with
"modprobe mac80211_hwsim radios=3DN", wmediumd in use. Not tested on a
vanilla build, but the relevant code is unchanged in current mainline.

Setup: the AP's wlan0 and a veth (eth1) are in a bridge (hostapd
bridge=3Dbr0); the station is in another netns. Association and the
4-way handshake complete fine, and so does uplink traffic.

  - ping from the AP netns itself (IP on br0) to the station: OK
  - ping from the other end of the veth, i.e. traffic forwarded
    eth1 -> br0 -> wlan0: 100% loss, one WARNING per packet, and the
    station never receives anything (DHCP offers are lost the same way)

Changing MTU or veth offloads (gro/sg/tso/gso) makes no difference.

Analysis (as far as I understand it):

Commit a536be923191 ("wifi: mac80211: Fix AAD/Nonce computation for
management frames with MLO") added mac80211_hwsim_set_key(), which
accepts CCMP/GCMP keys with only IEEE80211_KEY_FLAG_RESERVE_TAILROOM,
and makes mac80211_hwsim_tx() encrypt in software via
ieee80211_encrypt_tx_skb().

From mac80211's point of view the key is now uploaded to hardware, so
the fast-xmit path is used. ieee80211_xmit_fast() resizes the skb with
ENCRYPT_NO ("will not be crypto-handled beyond what we do here"), so
no IEEE80211_ENCRYPT_TAILROOM is reserved, and the extra_head does not
include the CCMP header either (no PUT_IV_SPACE / GENERATE_IV). When
hwsim then calls ieee80211_encrypt_tx_skb(), ccmp_encrypt_skb() hits

  if (WARN_ON(skb_tailroom(skb) < tail ||
              skb_headroom(skb) < IEEE80211_CCMP_HDR_LEN))
          return -1;

and the frame is freed. Locally generated skbs usually happen to have
enough slack, which is why traffic originating on the AP works and
forwarded skbs (from the veth) do not.

Workaround confirming the analysis: setting a fragmentation threshold
on the AP radio ("iw phy <phy> set frag 2346") disables fast-xmit in
ieee80211_check_fast_xmit(); the slow path (ieee80211_xmit ->
ieee80211_skb_resize with ENCRYPT_DATA) reserves the tailroom, and
forwarded traffic then works with no WARNING.

I am not sure what the right fix is: either fast-xmit should take
RESERVE_TAILROOM (and the IV headroom) into account for such keys, or
hwsim should make room itself (e.g. skb_cow / pskb_expand_head) before
calling ieee80211_encrypt_tx_skb(), or set PUT_IV_SPACE.

Reproducer:

  1. modprobe mac80211_hwsim radios=3D2
  2. netns "ap": first radio + one end of a veth pair, both in br0;
     hostapd with wpa=3D2, rsn_pairwise=3DCCMP, bridge=3Dbr0
  3. netns "sta": second radio, wpa_supplicant, static IP
  4. netns "peer": other end of the veth, IP in the same subnet
  5. ping from "peer" to "sta": 100% loss + WARNING at wpa.c:462;
     ping from "ap" (IP on br0) to "sta": OK

#regzbot introduced: a536be923191

Found while building a containerlab-based Wi-Fi lab (hwsim radios
moved into container netns, wmediumd on the host).

Full disclosure: I am not a kernel developer and not very technical.
The symptoms above are real and were observed on my machine, but the
debugging, the code analysis and this email were done with the help of
an AI assistant (Claude). The analysis may therefore contain mistakes.
I am happy to test a patch or run any commands you send me.

Thanks,
Lo=C3=AFc Kassel
