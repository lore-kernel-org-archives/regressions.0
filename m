Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BC7199E8B
	for <regressions@lists.linux.dev>; Mon, 17 Feb 2025 16:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810856; cv=none; b=Xjo3nM6gsNLhwRb0VZ4TgLWFldbsmGJYTRQAJoAhGchnxanpSpnQy527pjYUz20mLdQYrsUTkqiLNIAVWojGXi9iId8qLBBpPsoq0Sm/vVY1sJBos/m0IoJaXm7k1SZmOtXDqF2wTs9YOvuEvoURMr6H7hoRVBP3yU3606f10JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810856; c=relaxed/simple;
	bh=sw8pTD5L7f/xyTmDClNuUdGkQf3mf7K3EDXECSx0tW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXkKTcJnqJ1xPXrk8kgP3+MTFAppuVR2KYJOqcDvvpuYaE7V6gI4i/0ihUehCW9ac0PVaVwlih3ZqznSZiuiOy66HWAdLAhfYn4MU11I21IgAvGZmvoZNgKUCThY8IFpdETW2DRxe+Zzp08gAGdZkGdtbdVWyoOx5ll8a23MGHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHFHhdUR; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHFHhdUR"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-220f4dd756eso53308305ad.3
        for <regressions@lists.linux.dev>; Mon, 17 Feb 2025 08:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810854; x=1740415654; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L5NFIOo8aeK30zNembu50MeEzUimT6pz5br8YkV9ZoA=;
        b=AHFHhdURL5aayVD3vN2Md+K771k4gj76hozKOy1sVW3P0uqhx9CVlrBJ3Lphl+oVj2
         5ZseW4MbIPAL/IdQgBa67LnyD1j5x7PplUoB6BF2Y/PWgU6fNnhx2n1tCLfC0NttJt6m
         s0AHjeP83SJme8ZQdE5D13Q300TOpvds/RmrdjD7cFJsKE1u7QlR33VMX/yTF3hrN0Nf
         ozNxVWKU8XAOCvgGxjZ//rzf5nNyVhkJUn1v3DJFhuBSMUcvx9qMB8AUNJB4ViLFhWaL
         m6Rk2TkS1cO37kAE5ItuvJXi0Y0rEC9ylKzDjulMlU/rlELSwQoas49CJJNmr3YLlRcA
         O/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810854; x=1740415654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5NFIOo8aeK30zNembu50MeEzUimT6pz5br8YkV9ZoA=;
        b=BGeTx40m61i2AMWsvy8E27ybq85hsomEdgR0t+8wLBnWZqR51b3MKhgyFiYiG6+PlA
         BGiBY8NLFw6kSa9NEMbWWtVhDlTDSHu6jdK/zJQIsJfEPOe7kvbTHHTf4ajVZGpp4bR0
         BV3L7HgaWal4QWbhrt5dNtQUWoUBfD41IA9A2Ap0zGoW2IgWqbw86f1+JPovllc/OmTd
         VxveBHpApJi1K/oHKHa/F8JiJ7MVgFAUwVoaXs4oD52yTjHWEuvdNeP/H3jtsoffSFDe
         iI4PUH9UxuJ3L6XqcOXKRP4a6llaJK+aMCIwWQLlDSWOQ6v5DhgC+D7gdq6qAqejywO1
         pubw==
X-Forwarded-Encrypted: i=1; AJvYcCWiarBL0avfp7t/IdPC9j0jRUlA2fKFmdIEJitU5eczWqIgFgFQwBIEPkOAsuuPy5kyptoAo4VRzuJwiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvSS3zmqHDRQ1xX67tVrgDP0KThOIl8VghucOXt16vMJ60REq2
	sdkK8EP8ocCeHIzDSG+5kkQm/xueR4d78NTb4DLQUlUjtfkrZqan
X-Gm-Gg: ASbGncsTSXS8klGmLGFDQHARe9oDlmIUwqLqxbetUT+aIQAVSQs325NcRfhMfZtGsg2
	vYBHka9oOZjjASxjVJH9AlMqP1XYV9GWTKVlaprgf9SgGzT9ooQEEofPQ8VLWHxoR+I6tpzjBjg
	geawCHsU3oktKiXjN3sdn89m7C7iFo9OxBbuRfI7DhSqkGhbM9velDZIxSWZIWj5JHmUhK0USxQ
	np8yOPjZe84A0f0rfCSKEoxQa+VxzD+dmKJ6KrzRW0H/Xwzgu60nWV0BVUJOGyTntsJJ9O6Xpsu
	ZMe2Amh+O97ayyyPVrjXkw==
X-Google-Smtp-Source: AGHT+IFIaPv7NyLLy/UOLz0rxwj+Ad1zK/Zvxkn4+3f9o2V+R6fuvptqhKuq5mccuBSIPdyjYCU0jA==
X-Received: by 2002:a05:6a20:93a1:b0:1ee:8bd2:5717 with SMTP id adf61e73a8af0-1ee8cc18814mr17494408637.42.1739810854231;
        Mon, 17 Feb 2025 08:47:34 -0800 (PST)
Received: from localhost ([2601:647:6881:9060:3ed7:9c4c:c545:4371])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732521b82b3sm6602344b3a.92.2025.02.17.08.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:47:33 -0800 (PST)
Date: Mon, 17 Feb 2025 08:47:32 -0800
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Qiang Zhang <dtzq01@gmail.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
	stable@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [RESEND]tc-flower not worked when configured dst_port and
 src_port range in one rule.
Message-ID: <Z7NoJHQ7hLiTXuA1@pop-os.localdomain>
References: <CAPx+-5uvFxkhkz4=j_Xuwkezjn9U6kzKTD5jz4tZ9msSJ0fOJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPx+-5uvFxkhkz4=j_Xuwkezjn9U6kzKTD5jz4tZ9msSJ0fOJA@mail.gmail.com>

On Fri, Feb 14, 2025 at 05:00:30PM +0800, Qiang Zhang wrote:
> Hi, all.
> 
> recently met an issue: tc-flower not worked when configured dst_port
> and src_port range in one rule.
> 
> detailed like this:
> $ tc qdisc add dev ens38 ingress
> $ tc filter add dev ens38 ingress protocol ip flower ip_proto udp \
>   dst_port 5000 src_port 2000-3000 action drop
> 
> I try to find the root cause in kernel source code:
> 1. FLOW_DISSECTOR_KEY_PORTS and FLOW_DISSECTOR_KEY_PORTS_RANGE flag of
> mask->dissector were set
> in fl_classify from flow_dissector.c.
> 2. then skb_flow_dissect -> __skb_flow_dissect -> __skb_flow_dissect_ports.
> 3. FLOW_DISSECTOR_KEY_PORTS handled and FLOW_DISSECTOR_KEY_PORTS_RANGE
> not handled
> in __skb_flow_dissect_ports, so tp_range.tp.src was 0 here expected
> the actual skb source port.
> 
> By the way, __skb_flow_bpf_to_target function may has the same issue.
> 
> Please help confirm and fix it, thank you.
> 

Thanks for your analysis and report!

I think you are right, please try the following patch. I tested it by
myself and I am working on a selftest to cover this case.

---

diff --git a/net/core/flow_dissector.c b/net/core/flow_dissector.c
index 5db41bf2ed93..c33af3ef0b79 100644
--- a/net/core/flow_dissector.c
+++ b/net/core/flow_dissector.c
@@ -853,23 +853,30 @@ __skb_flow_dissect_ports(const struct sk_buff *skb,
 			 void *target_container, const void *data,
 			 int nhoff, u8 ip_proto, int hlen)
 {
-	enum flow_dissector_key_id dissector_ports = FLOW_DISSECTOR_KEY_MAX;
-	struct flow_dissector_key_ports *key_ports;
+	struct flow_dissector_key_ports_range *key_ports_range = NULL;
+	struct flow_dissector_key_ports *key_ports = NULL;
+	__be32 ports;
 
 	if (dissector_uses_key(flow_dissector, FLOW_DISSECTOR_KEY_PORTS))
-		dissector_ports = FLOW_DISSECTOR_KEY_PORTS;
-	else if (dissector_uses_key(flow_dissector,
-				    FLOW_DISSECTOR_KEY_PORTS_RANGE))
-		dissector_ports = FLOW_DISSECTOR_KEY_PORTS_RANGE;
+		key_ports = skb_flow_dissector_target(flow_dissector,
+						      FLOW_DISSECTOR_KEY_PORTS,
+						      target_container);
 
-	if (dissector_ports == FLOW_DISSECTOR_KEY_MAX)
+	if (dissector_uses_key(flow_dissector, FLOW_DISSECTOR_KEY_PORTS_RANGE))
+		key_ports_range = skb_flow_dissector_target(flow_dissector,
+							    FLOW_DISSECTOR_KEY_PORTS_RANGE,
+							    target_container);
+
+	if (!key_ports && !key_ports_range)
 		return;
 
-	key_ports = skb_flow_dissector_target(flow_dissector,
-					      dissector_ports,
-					      target_container);
-	key_ports->ports = __skb_flow_get_ports(skb, nhoff, ip_proto,
-						data, hlen);
+	ports = __skb_flow_get_ports(skb, nhoff, ip_proto, data, hlen);
+
+	if (key_ports)
+		key_ports->ports = ports;
+
+	if (key_ports_range)
+		key_ports_range->tp.ports = ports;
 }
 
 static void
