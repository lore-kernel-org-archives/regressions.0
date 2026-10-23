Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792778941;
	b=S89GnFD4FNf+UtuRHkbe88AaKWjF2OtVxmWtocjWTlXledPXShfv/3JqTRwwkBaxqbct
	 gsyJrsdY9Ix+1x0n7mUY/tch/zQVk5zz0wwQbvJKiEjpOgt6GUKrh4UOg8WL5JDr/V9pg
	 nDbGgxmWy4XD4FDKLVBJKUJLynoZRNGaCEik3vWd0svNZ//pXP+O8m7OlC8pXYH2D4t0r
	 OPi+6TKYm7dIjnHe1nqK2ZIY2cYowsVLh3k3/yCGn+VPfCAIca+DS3Ug5vWqkMLucxpWH
	 r4JV9GbcsOFbMY3JQi/O30W64NN0AYLHyU/yYBl36HYYXYQWzItAQqfrif3TgEKJ2SQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nKpQdPCfN7vtbw7obZJvLCHSgtoYzv6z5biXGbDum1g=;
	b=lsEMdvv5vDDJzT9M9v8fU1JdIJ215Ea2pXtf+y904Tdkm5ZPQcoMzVxhIDFHzH6YDjXp
	 z1EpGxmjrUIfvOrUU3lBkY8xCI+8403ifGynZrk/487CIa74N88gW40QvDntyQM8TJFpw
	 YOCbsOc1vvHVKq0FhDhV7iIBjJDSPnCm37AAYdhbX0sFXupD1jXSpm9wECTFbEzr9IoGN
	 X7KxrV2PXTKNFRcAe0f+XN/uLLa5x3H0U5jzFHV9knuV1QYzAb18COcVWhu414M0Mn2XF
	 IfKgNA0gW34GOXaQrMgiH+LBf9nFXAc0BcTFiwqPgJ2fg+eWy2t9CjVtMXAXrUib2SQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I9vbERGw;
	arc=fail smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B456E606A31D
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 18:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B456E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I9vbERGw
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ac65e845a8so10281831fa.1
        for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 11:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792778939; cv=none;
        d=google.com; s=arc-20260327;
        b=TGiRbAXw0xYljxYLhVxJBtrMaFe7L1955UZD6VRPXVME+XJJWkEtYBghcJdQTkmfgf
         9tJCqhGt8naMmzdkenRao9nhxVsNW8DVh1Uv2ykumAKiHFEfYlzWoTpG70BofkdIFB/E
         RRXKw2gjUeTzh5DQm4xNNpDD4wnSpAyqcEPZ6N727vk/XEIQue6+rd6xzSKGxCEE1ABy
         J/p4uPxDLFn7NkQcDGT8F8hMkFH8387MulZ5J28gWNrSokBmrVHNQL+yPTUAqUYTahiV
         fcYJD7P/hggxXSoH+x7lzWXWLsfSmW6Lg/giZOSpR4K0SNHGtK/9QYhDbUfnlMkBtGdu
         WvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nKpQdPCfN7vtbw7obZJvLCHSgtoYzv6z5biXGbDum1g=;
        fh=yWbbTr6y7ITz6cVUMA2n7dVvEY0OJTkdj3c1IrEAMh4=;
        b=mQYPCWPBE6xwJFa6wKa1u1k9ekAHFddHN71he1bi5JvzNAhdHqm1yWw4A1hGKjE3KX
         +PzD8009GCrbVPFxOyoVcBUty1pz4fUN/woF+0dPnjr2VZan2cGfABOVSvQkthTY59aR
         Ck+8Wrn2Qd+WZxiXk9BmvwQ/AVTeraiovGGSKDOlkA/0r9/liW1/SWiSm99wAV02kfj1
         t6LhkDQ0OznOfW2UUdfmf2tqDgz1RZq2AnadDfn0P+DZ/prsaOfR7bAhCkaney+5SzfI
         gIdrO5Ww0yvvUxejv6+uq5rDPRpDFpfBlX6otcr3cpv4vWcWs0jhegUgIT0SoAC/qyOU
         wiVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778939; x=1793383739; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nKpQdPCfN7vtbw7obZJvLCHSgtoYzv6z5biXGbDum1g=;
        b=I9vbERGwuudXLQ1JhloCAekOtVj93mWfEGllWmIeZJISoYYf/9uU/WvZKZPWpBPAGw
         enwDq5SmoK6vVlOf3G+KdOcX9e4wb8PKstzfMzzAheIQKuStrhz/m2eCnNIrd2AZhRGA
         h8rFE+ImPaGGwN7V1CNSC2CE2ERCvUY65OfjiJ6swrvT3rjoAYzPsO2R4zDrPuW7EMcZ
         tQuSiUO7E0op8ajtxRrO3fw8BVFEUYYX9HhKRlSI53QexizkAIRnofha2zSNTCt0nZgY
         IDOQgXZVMMoF/EXe6Z6fGZNM1zuzj7/Xi/k/GyqzhckxfATv1vt4LFJaUjPJXcAT8ej1
         +liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778939; x=1793383739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKpQdPCfN7vtbw7obZJvLCHSgtoYzv6z5biXGbDum1g=;
        b=g8cvonBViFz/49sUwdCM0Tgm/XSXoyp1jgd5nSGxYmjYMblyi+70Y0n6/f9u0bkQYv
         eipgN79pvvySM8tk3m3bJT2TISYzsBFmmbytf0MtREH7y1Mvx1CVIT3ZjL9DAivdYWAZ
         TzRHN7yf8lL6TwC25iaGSeoVHsj8ljHMHKIZ7I0gyOOQYdOFhyYCYNTjXcVjRS6Hin4/
         YsghIeUBF8T6xWHhd8zsKxYjZRlrKM1sB9OSiJfsoySQAd9/Qo0YE4FtH9xtqqLrLaKC
         UNoKIu6waS62PWxG0Z5n1db4+6CG4nRGR6KiNkmPhmXmx/PL/2nJ7d5ugts35f2Kqe7G
         5lxA==
X-Forwarded-Encrypted: i=1; AKwUvBx9JWL+yL3hvzvOA134d/XHtl3NogwLpeUCZfm/OpUIepmH5oRo1q7PQMdPDePLe1YhSQXkmwWwOTN1Hg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKpj67wIcOpzVWNooYRH37I9e1FzdOY24vSJPuy3c43UWfSk6BY
	TfFconm1KIfEebR1TOckLwlScEbh/Fca7cVhfyEAosbWjhrgYizlfc5elb2n09UVaRs/OX2sS00
	YSru8RnjI7TNcNsctPj2xAw6TXTj79zs=
X-Gm-Gg: AYBFou3fN72qTScAcB6qLdjlKBmzNHAHnt23anj8Q4C4qeloaqDPytX+w+qHg8eLVrH
	S+JzR+adUJEqRHemWhjefqpqWFQAOIuW0ZlqeBerA4m7OoAq7NeuN2AiIi/86TV83WdYgjrr3Uw
	fXVZOmoQqyS6mF0nTy+P6oqXzkkC/yLyWkOeDFo33mpcKswxJQvO0qodzE5TWC+LKczBaFSix7b
	VExQRomOzswx6isShZ1VtitJUP8oU+Yi8A2xHXExWWhbsNbcrS+QNsD2zSvr9pLSHHwv9rw45Jd
	etLKAbIRa9/kI4Mtw6zfGDofmuet4Wk9la9Y+IKPsJmsCwqkeFmPzhtB8vhYoeBPiPEad8rUhT8
	jHSc4KKs4lOOIZsEl74zEUNMBHB6Z8Ey/V1trqlG/ottV9szS1g149xK2KxfexkjUNIFBAq4=
X-Received: by 2002:a05:651c:1b84:b0:3a6:62bb:906e with SMTP id
 38308e7fff4ca-3ac6fd4e4cdmr269461fa.20.1792778938495; Fri, 23 Oct 2026
 11:08:58 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAAzpgGfrHpQZQ8iaH5fqZHzk5tTx39+jGvGkVXxhYFkp-A_bQg@mail.gmail.com>
 <CAAzpgGeAaOjPdiVOmeY7xZqEymyh4BfhESwAvTzczvqj+YuNHw@mail.gmail.com>
In-Reply-To: <CAAzpgGeAaOjPdiVOmeY7xZqEymyh4BfhESwAvTzczvqj+YuNHw@mail.gmail.com>
From: =?UTF-8?B?TG/Dr2MgS0FTU0VM?= <loic.kassel@gmail.com>
Date: Fri, 23 Oct 2026 20:08:47 +0200
X-Gm-Features: AclHuK_kKsOTsWBx0Yucceg6CRaakmJTdlvJSrwgu8_JgodWjgo2txSWsrgvUvI
Message-ID: <CAAzpgGddO8H3EVb-WhXEeiCeoV97NuV0G22UZcHmyi0QZLwcMg@mail.gmail.com>
Subject: Re: [REGRESSION] mac80211_hwsim: CCMP frames dropped on fast-xmit
 (WARNING in ccmp_encrypt_skb, net/mac80211/wpa.c:462)
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Sai Pratyusha Magam <sai.magam@oss.qualcomm.com>, Rohan Dutta <quic_drohan@quicinc.com>, 
	linux-wireless@vger.kernel.org, regressions@lists.linux.dev, 
	Felix Fietkau <nbd@nbd.name>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I tested commit 6832075ed4ef ("wifi: mac80211_hwsim: reserve headroom
for software encryption") for this report, and it fixes it.

I applied its one-line change to the v7.2.11 mac80211_hwsim (Fedora 44)
and loaded it as an out-of-tree module, then disabled my workaround
(fragmentation threshold) on the AP radio. Pinging the station from
behind the bridge:

  - without 6832075ed4ef: 100% packet loss, one WARNING at wpa.c:462
    per packet (10 pings, 10 WARNINGs)
  - with 6832075ed4ef: 0% packet loss, no WARNING

(The module also had my unrelated beacon timer fix applied, which does
not touch this code path.)

6832075ed4ef has no Fixes: tag, so as far as I can tell it will not be
picked up for stable. The problem was introduced in 7.1 by a536be923191
("wifi: mac80211: Fix AAD/Nonce computation for management frames with
MLO"), which made mac80211_hwsim encrypt CCMP/GCMP frames itself, so
7.1, 7.2 and 7.3 are affected. Could it be considered for stable ?

#regzbot fix: 6832075ed4ef

Thanks,
Lo=C3=AFc Kassel
