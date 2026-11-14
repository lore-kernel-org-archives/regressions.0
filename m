Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794685418;
	b=zL5qJG+/74FJE3ZagC//DgqAVRNEyixc21/QU9WWcV2F2w+n4IQLwja0IH28n1/As7f3
	 W5mKTsW95JgAf5CrgmkqgQMk3HO35wls6S4JjsU4Y34B6rveS/XvCspER+kWhVFKBUrxy
	 zDm3TNOQEkpLwSXioD+HuQjuy2m0T9GZouQSUn32HBJxUfRDO0FGKCjO0QPboqH30D00a
	 iIVT4sMyZoFWkuPDWbU+J2EJIyfLV0PKXTokClpc+OP5eUfBR4ZD08ynlGnTy1oRcXc1M
	 Q1ZRUt5/BjiQGaBAqnKmBdl1zZWeC0Kp/yih3Rp4hzY9vRbEr8l83/liQ92XkXqRCmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794685418;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:X-Mailer:References:
	 In-Reply-To:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=RC5svYkRCx3YImpYBcoqR52DklstwWfeFuNed2INh6g=;
	b=p6hEtIU2KmKx8cGg5KGK7UAjRWdP0Uqf0K6DYXdLQrA5oMtmlmG2HsUC0Tn0HBsS9huJ
	 /X0zlSXfBrIJrnhNJTGuEjuTWmU2qjWial1DCLjWnOwf9zYosc7o5N+Ls8rq3mSC5+9fr
	 bQNC7nh5BowRdvTqOCuFwJ+BKQsmFlQ3DbHbd+aVepbNbeA2L/lgja3eEhdi9cq8SkkaQ
	 wfu3p118yvJXNomKVT7DCqeOIMCY7IhbfA5sgNGLn6Ayp6KG13hnEw+/g7ZYO7ILYty9W
	 amLEj6kZgqiIvsXS02bCyKl8S3abrwum9CKtnYxWYceS21BI/OvV0UJOr4/i6TmyVrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=pjjonas@web.de header.a=rsa-sha256 header.s=s29768273 header.b=tL11+cgU;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB7A606A32E
	for <regressions@lists.linux.dev>; Sat, 14 Nov 2026 19:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDB7A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=pjjonas@web.de header.a=rsa-sha256 header.s=s29768273 header.b=tL11+cgU
DKIM2-Signature:  i=1; m=1; t=1794685415;
 mf=PHBqam9uYXNAd2ViLmRlPg==;
 rt=PHJlZ3Jlc3Npb25zQGxpc3RzLmxpbnV4LmRldj4=;
 d=web.de;
 s=s29768273:rsa-sha256:fYsPyGjMuT6PsWg/csDDOBFBJ+dF
   BVufAZRUQx7CaDDCNo3eBX9Kums2r+LwdFwFuxZ3VZVtF+rZCuZrmuwS93QPAF+X+FSDm8FhwkU
   zgFIrTqZ3lYkpQyQthXY/O1CBni3oTrsc/Wi3O+tUMk67o+M48+nIzN1NqanfC2t7ETC5vQM4eT
   evn5lCw+kbjjE4yXl+bdHdmrhpJUQGLWXO0udbYop+NyVWOO/TP2hwOJRpWkmvlrp3WPO9o48/A
   izhVZ6o3Ce6d2qANHc6onAqno7VMDemLh+2uPbsHjvXsUWP/emSuLE5GVb+OH2VSUlYj4E8U1Y2
   Rmc+HQ0xfbGthw==;
Message-Instance:  m=1;
 h=sha256:
   XjqIyHAf6ppZ4ipHrF+6ukyu9xOW0XKEpU2Ly6RAPcg=:
   BLg8LOeUQwdl7Z9YKD31ZgIk78sx61/p9zvvrIVNeaA=,
  sha512:
   AoesKwNrF7rmdgL91+EL29X1IvSVztzqLVHBU6KymmySJHGvGKJD8m/QqBSUeaxfCyRzmssCxyjjs19/dRmD8Q==:
   hUjtCI3DvMCqYrx/eqoEpWtD5zV5V9oF8x1Cz9aWP6k13gFjQZuepttpBSR365PD8HMKqgKleypk1//pL5cyZQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1794685397; x=1795290197; i=pjjonas@web.de;
	bh=RC5svYkRCx3YImpYBcoqR52DklstwWfeFuNed2INh6g=;
	h=X-UI-Sender-Class:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=tL11+cgUbTnkewAr4UEzeFsv2Qg1pVizQlS3QmnAqK/298yGbQxfEP8XYKxRqgA7
	 svj/5LvslQJzEYucYvUkset+TFnRdlCbJUq4iR5J8X7CQiKXDM2Pw5+V/yCchH28/
	 oAJT2yW2qF0rCd7hqOW3kNF+g/UpfDbkU5KGm9tqdeyaXcLQj9l3u9I6cC3OOSvuU
	 Cq5hh1l4Ume2Ez7xo4Z6EuxVNzeH2MQKffrU5F+y/ZgoM5+wPEGrON7Xxum3wCVVi
	 DEDOdha77fouCDYgcuZ3NzqnbibKXtqD+sGLvRpSD5MqskJ7k8edyAbqTJzqrQC9q
	 UzerDuVTgaNDmOmupQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mkmzr-1wjrty1EER-00eGRJ; Sat, 14
 Nov 2026 20:43:17 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 20:43:14 +0100
Message-Id: <DMV6VK9PMR0Y.1A1I0R6M19ZJK@web.de>
To: "Thorsten Leemhuis" <regressions@leemhuis.info>, "Philipp"
 <pjjonas@web.de>, <linux-mmc@vger.kernel.org>
Cc: <regressions@lists.linux.dev>, <ulf.hansson@linaro.org>
Subject: Re: [REGRESSION] rtsx_usb_sdmmc: RTS5129 (0bda:0129) no longer
 detects SD card
From: "Philipp Jonas" <pjjonas@web.de>
X-Mailer: aerc 0.22.0
References: <523eb7d1cc0811df4a5e4c534538f3dd@web.de>
 <eb52777b-8607-427b-a709-cf1ab76ef672@leemhuis.info>
In-Reply-To: <eb52777b-8607-427b-a709-cf1ab76ef672@leemhuis.info>
X-Provags-ID: V03:K1:tdhsFLQ7cZlHV9v9lD2Qho0qy3ZiM76ta7JTKRcMHNlQSEUe7sf
 kH4ea7Ce+/CYBr+zZF9jD3mUBcQmpqxDAY4h7NQtFWORI30VsBqmfdJAIaDEtg8lgZlUEoX
 i54lHIAbwOnVvoRsY3c+nyHyDtOihTeK9hMAb+imzRHQ74jU8WL7GRQhNdlHZyT9UeKknWU
 jyFHaqFdsuOK7QZ9VOLKw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gdBvsHpLwCo=;ZVRpV/5oXhs8mNiVCs6nFHXOfuY
 PyWytGoP5SAV0etWIs2AtN3Y3JLEcu2CRX9iIsejDD4wt4m7M+i2Ao61wu7aawatyPwQ7HUmE
 IiQN3K/GF5pHfwtcOFAVWy1vDSkcSY6bceSocTfH6tHTpDBoJFAvfx6GLtzR1nHA2PHKPHJJs
 /rF2yuwhzJSrtSoASTlHvjqg4Bm2YDH71fNN2fg5lRS9vmm1FN6A7Y2vVdh00jqPiyMvuKtEJ
 kow/mSyWO/k3YwysepviwArSbj3nUJd6M5HR4uTa9CKSYq+T/68/V+qVFA8mC6whBYYUayvbT
 pN2j7Nun78Hs7U+H5b2FjmJn/sdlBR5GqzN6/7p3VQOKuVxv+N5OIJOVIvCH6nb6wEtFKsER2
 vlZRTzKvNefVf06bqBosgyD/l1P/1FNQktd96urkBWkRBMJXi6zmPEjBc1TwKJkiA10NIyMTx
 oXxH03+D/usUmTaUK9pgLex8bxFMjGVTerCzv3LEQ8fpbWfap5NHZBMa2pcfeAfmLWzDQYkIl
 WHvo5Gmd7beC13/KuC/0tabYBoWEaHz0xqFVwv4N4jBt90A5t7ofwtRBaeyHJR6w5lQ6t8PyG
 JHOA72tFKCLXkhvy9PJ5cuMpLk32GPwIREL41tOp03KPIh6bakHJ+28CM9E0rIu9rMTC9O2wz
 A+tk+EaHFE6r249krat6OgKM1DXmkdutJLnps4yQ9GRhaEy5WGeuTbSixyFQKF3iY7hR130cq
 V8G3HRyAtyAW3xIHqlUioOYS64oG4D4P3BeDSRW/l96MLqRLyyCL02X55bsE2ItAMJCMgKtSU
 4/kF3tI2AtfqV8XmzQNUceU6Ij0602hK6fip7C6NfiIzkyl6wwCB/J9Mx25fqjHeU0Is61GJz
 EENn33zNbKteVYIK+6XVIWAw0wLocwVcVZ4a7S2CsJJ+AWYUPmjVF/xkyy2PkVMIy90X0jFoK
 VUUrjgnop71fAVszBZ3dByiG3nORYHfH6qbasO5hutIJWbKu61typzO14tulw9wR7a5V+vOti
 YBUYFj2sPdKrd+1vPWzHxap7XYFHALyEiNaj209UIEK8HtqPrYkCnZYgjz0PRGxQo0mdhu9EI
 +9Ml/KlCAh5Q5ZTcE8cdKqpbc9JxQnLL3xnl3YYO7k6HfhxMdu65y4jVyNzIL4/DglZGpJZYk
 HSIo6uho+jtoCINxWMgMPrWERsblR+HWjyzZpyO/1WhRbS2mvsYLRK9LKD3Vf8+PmYjiWrnPT
 uWeapviSZ4gdDhzORcX/uN2cOjjmMlw7hVsMGfvNnj5q5nX3h5CsfcLEKWtJLFf4lEWW+W26O
 kWZPQdt0YRcBxgqIgb1tFMBImJJaNmqQzBG3GuxEtPZGwyX29MVkxEs1JulgP+dEJ3bNa7yWM
 0459IASemy9YY9n3pNpdWUOzld1KjrDnpIs4EUw4DM3EDlIfCK5tIXvGNwTknYYSEYGPtlMj7
 jp4yM3nuagMba7Ayoj3l/76Z3tK+UzLRn32JEzDul6DxLaaOnC8aY0PWO63HATkIiIE28zoow
 O59A+FsjktnAl18bGVOjmGXlP236a8hrXaNyn9f7fhZyt4jbIsBrvdKXlfGWlH2/bnYNt/ZS9
 PzBugzxfhdvSn38QEK9XWgAETalHWk2aolKUouOMvFG4VjxLyt14WiqkFO2T3gZLgawCFgIR1
 vIVV0QphgYnqqLudjbjegi8YNmqTIKxOE1+UszqNIKSr8VnMoh3yQhA4AwAxlrWZI+xSKC49z
 VX0Gu6sSuC8rxVlBkWacAYS0NxEb2Mel+Z34puK9RsoklWsVvoy8koVVpmGYc/Oo0dPBr8S00
 neNQJKnqQZSwkV4YPjo6eDBWckvgqK1/Rc8FCnATHe4BIvNRHSMjqXLAx/XVfWy0DuTJ8tTZy
 eFNHtRkivm1GwfvDvJbl73WF8PTTpB8QB04Jh9Fn0uufgIyh+gcxt0kDzace/+8J1pVx8QpGW
 12BOHRHu14FuwGjWm41qYJlAgVpuaJvahU6R/cAEPSELteQBy/+G7KhWQoGuFFQbUAznNhqiD
 BkpFhtZWABnC/Pa9y7hPixv/mi+KxWIiwzH4QEeF72R0ElwUT9zAZ/JAQnJypY6gZx/ezPIkP
 MW8EaEonIcTMalHus+Dp6Vg5qet8sElZLy9/ODPKpzLFUjuRSq+E5N+cSpFtyLyA0GWqx6yCR
 kKGhw6Y4cNz8JTe7saa3c8JYq9t4Ws/9rAKOVC9avMD1W/Aad2Du15rXmW0z59vY9ZGkQxZIK
 lpXcDsVn69Yem9a7KmKG93OJ2PXaV3iIDLusrKI7Cq4dtBOPY76w7vVc87vhebWg5iaQUYi8x
 Pif5oUiIPWft9zWAPosOxNGhc3hHNt6y8BW8neuMvYZjK5QlulwZH86WmvV26zX8H8wI9tsWU
 zUFsW8AkVLcWLsvg7w4m1gHnrxBvY5noRxmOVmwrPNxU3BfOLnO9cztWmdkgFpBn0UC6DvXtE
 +e6dP3C2RdVm3UJt4I7clnNXu+eQhQprhNntn8PUJuI0BWdrtQnTjOe7MZx8OVTziiSIii2YY
 ++d/NsqezORj+/rT1RsJWF0BXe4EtkjcB5AZmVG8nln613HuYM5LC3qnMGk7VcxzlWX52LR6d
 ExoM5wzIAfVsW5WfbN1rky448A/MEzepmufXTCh7noVoSAx6GTZqNmU6AN/lSeyPLdSeDuwUH
 +b1P1t2SpamJ4bFBmxhxFGcUICcYTLST1Oqtr6WoB+/ZtvxrRoAw8bA5BqpOqB4ureDFzIHn1
 3oR52PGTShgoMyiMyz3j1YOvAXstBqb9gjc6YyOpOECKnQBbuHwiDBOQRh0WIvD0dNuxXw/sF
 pBebcsE7Gv1wyc9Ctd8l6T78tPFcnebwFpV1jEWDkvVZ41HqxicQpQ2z55meMoqdqTZtKoCPJ
 wpB+hN+aosPZuHZyimOLec2DrnX7KQt5ukQ/uUV88syOfDDzmTnAl2LnI41zxVr51JHYB2yjQ
 wj8Wi+ocKREpI6TJ+IpIJXvi5tk6HEqmEg7pKdydMWPMLoXRiQRYUOQEnaGhJMuym9jsFd+Jc
 5JtX8lG8zuIaiiUp3ldaOfcr2RHL5d4lM9cN7PUeuol7rowF7+eQpTDH076PnaQ6gfZDHJSmK
 GM/7Lc+ESDlheOx6bdXOuHoq0PRkaB2P5uwoZFky6g9a45G9nELmcYcac3z1TJVj2PmRhnAI6
 t8z0yrohtJmotlODldJxng0AgUomF4812gQxvCxfrKeJK51GdF+/47cT7ZKlwlUjy/BxQB0F/
 4hQC0Aa5RD0RmVrkUYeBJO/gz3nE36+ofMjQ2xpSCjPQTTU/pobmbNAKtLqkyLQoA/4Vl8qgy
 RXkYNuieSTu2qoFsIXs3gGQTG4xWfeehGiSbelg0JmdZF7hTHCpMl6tvT+R1mQ5w3lAHOkWhr
 GkORR0c7mVPmQk+chonUIXsHaofi4w67/tDqhoPAoJgem9UwuJMYrHu4Zrr+gH7G/1DNIfblS
 eYEHitTtdQTZMLxJPuiMOLtUOPoNDFwvvCQpmnsiU/uuu33snq+/gVUiz5yHYyaLxf40yG7eV
 Jcn1ubw2O82XIJ0NcHL5OKE32Tads71IEcFAdow9Z66zaq030VMw5l0W5XWNKm6jH1HvCXm9C
 OaMr7AHGj4UhZ9ZMdKoQyqsRRUIaY/LRFvNDGfbiRoEAj4eVSUZDgedaBh04fLVrELFcwJoCt
 1K2mEIRUL6A3t5oUsXav7vxLXQkqpiYTttb2AVQqRYdK25skh6ViyI4AnZ3/Kfd5XUYxCPkns
 DX5puCJpSZtpVKDZ1B8Z1i/HFaq7BOfnRNgKiwNE7SQHeapBYTKUqmgiuQO0an3UYnkJZ+Av/
 4rBKAP16gg+mal2hBUTlz41JQtXQ2L7WfGXfQfseEE2Qa/l/wcdOd3GVQ1CFMBNcdbr99dm1u
 V5vbMdnpE525EeOUpBw5br6Z0yZp3ib/j2iDWNC6QgrhIHDL2v/B+SrkYOMDbOQw5Mkp9a5C2
 ipJt5Hq3lrGOhCIWPuA09xKKAth52G9Q4THcxiWi6gULXyKrjox6LvBNcTXSWQkVlfbX6Uq5r
 C18Rm+PxMoJi/Oz+WKxz+8Sbs86gad3KX0ad8ZozJWK2J+pEIJ/GqB6hPE+1aBK+MXpofS9OJ
 WDj0hH+RoGpMvp3DqxeYB+iSOTSMW8NFWCUTOPKU6Iag//xUNoxj+GrK4wq/lb5p10VteElpK
 r6Hk9pDRG4FPIJYlmlda6BrnDKjZDZ0+LZ/TBWNhXDHlCBHs+mv8nz/JzsV0WY4vv8hNjp/oX
 591w0OS98hxtRTkVMv13cSxyDSv1Bx3oVvHbyWKMyAEZJJK5nMWgHezapqa+f34Lyr15zRA8f
 GPUssr1gcWkuf0N0rOMGjWZBs6gEjmTLptMxhl64Dy2KZCV4nOPs5v5ambRTWIWGbPq28gQGr
 9Yb8mErIgiTfF4bcYEIwgK30RCcIer7b94bFhlastIJjdjpIpHUiEeyJDxKvA3BuNYXgZJV4M
 4RnHRhMPXgMTuc5TeM+0Yp7MUZV99N0FKBD4fCPor1gnAwsCmpboYifkKpeqEnohklSfaSiZj
 prJtmrLZLIaQAoXcn3+maMk4rnyeTV108mg9JrV1qVM+9WEUQm6+/i5wAIBfdy3kURQJeu+GO
 SHmrZfAgHtnpVTAnhLy146hzj6RhQ/sMcy3DRMWSZm5ovKBRH6TZtnWQXkgcaKHUT4OJWeJXK
 gm1vbSmfPdgE0KFvZSvVsKfwSVPzNB4CXHjT3iqjBig0E2gn9h2/EQIJwd14uJ5MU/47nzbAs
 Xu1LckWJ+JLQFU/mF9Kbca+T97gcKrQ0XmP4LTLY2hplw3KD7zF0C1fOoeMB0gUTeNb2gnpC9
 b5aIdAR8bKleieMOZn4MfVNwzGESfBtYZCe322edd7yTuXsnGUTCsRaQEFgHc2sy8Z/VYfFPL
 BNyqtGqGbrDjVcAJTgfycZXmVB97XqNKJuidnBv/5RR7w7VSYZCjdalkSLDr1npR2oSeBzzka
 z6JJp3EMCd3Ag7mxpTik8nZfZDJz77NfP5+TgNiNEhoQyBmtTenj5P+lW2Ir714przwZyhTH/
 JL239EHVYZZmR8/67ENafssYAKmfYj63w3lbErN2FGAkiFsYNlG3jFGYNi+h7oc2s6rcEVWAd
 GIzTbSk0CJH/Mkp2bDBizf9m0HnQruU3HPXPs4LpXiRezmZS6dx1GCU6wb/fViGJWWnoQG7gl
 XRIPq7kP3gZv2XRVTayZSW0zfABsct09ohI9tpKz7k2CZrCdMTD9KyOqD+dacXiGhqG7YtdMJ
 AV6bsSufKnfX2OFgb70kgdzqtPIAfXxJiDCsmTQm60tJAZ0lOX7LbeG8SGfiFa6udBU9h0XEH
 APkMt8wGXYu0I6WBAA/M6KSnPosh3/7YOhSLGS4bPyHNantv039K4SlAQLb445AxXhlDDg0aa
 bmyBhmYeW+Q/w1EQWZ+d0LDALuruBmT3fGo9RLn6ik3FgjGvmPs9Kvk058V0cEVdTBrqW7d6e
 3wwEiU+8B6VIemBgsemQCdHTw+WqOpESlH13kcTDIedxtVuRRljPRSJuN6jl5C4JYT4BQiUDt
 K01ze3igbX/2tqcFeCcWum8fc5l+/antXar8JOsCGyoGH7XUleu2OxnpwmHqml4osneaFI84C
 q2RSH1WQr6AnxP6+QD27hqPEyeJ8SXLRQCBvax1PzNMTKrn1TB0xOFaB7x99hP6HgZ1F211Sk
 +4rizYRCOErerNMhrA23m/RcurJ3uc3P3wJ8NpE5Z7RcRUFkEVf6uocYvD3H3/FqK8L1yDkIW
 +vQakZ2RxyeHToUBiEwMbzF72HWishtsD0UzbRmLYgE42z4dajH0LMKUby0xBpK8RP7o5yZPa
 eeJeUM4ylzfO2JvudKBh5JtjX8D6GpoBZTqm3U2o1sKgkimir8KAcv39xIeYtJ3x++7I2xjMl
 wLXrmlsIbbPXvd9hm60W1xrMHdZg2uAdw0T/J73o1tInme4+BFmt7vBnO363PyQLWeUOTFFHB
 QA7JaJIO0DMeRhLHFrDipYuqHPs20lc97BK4kxSg6rpWsVsj2QuHlCOBD7cefbwlwkkUvJW61
 oJWS+ySfCqm0rtyrlj9atQI1ra2hhPITVIWuvd9XFvARc7WKRPCcxvMeQjaVoqeA4xFna5lkV
 X2QnyC9aF3SIhO2zsOSqvGxFjvew6ePDmfAw4EOyaVet0WYKcoIvqhN5kQZcTCeJYdUsE7zDF
 MZeD0yS6Lgn3o0tZAYrvGM7CWRAemXgvqc41OLx+BY2ILhedteesithJ/OhqFFXYNttTgfcdv
 2HNvMcpE9UYhKHM6LN+H5d5WAoHQ2U55ed4HO2U4onYa53sgqNdBsZlT9YfFIbYHO7dTOn+QY
 LHqcO+NwNh9p+4N3NBcljkrO/PuneOi9qXJ7eeMGxLGSOhZJg2biLv2Mx0VUoKPH5EF992dW0
 F0eHv93NS3aodfTLCTeCeE0HCbrgJH7k/5pgsIQcjztDuP+QRjKoR7UZRwUA2WJxj2ZiHTbYf
 Z/k7PZ9rVQjqjUOuWvY0ZUJeJ96u2Ns/gC/sPkQ3k7jtRPNqMJjaa6fRhLO5DFH6xT89T24yN
 14Z1tPsGTh4CrJU6Ujezimt0yaDF4vLB/Gq6dz79de5P70O9STOAuW6WmA/QFfgPHXybkZxeP
 GogVa19Sso7v445RaIlKxHXoqytTOZ8fdNciyEcsrnuPqiPCv5BFxBmKwhoOZdOB141v6L4pC
 KDcqh3bO08s28UeSO9X87EJWgkunofU0shAu7zPpn0kqcTHuBF5WUafjk/xERzQIEFcp10QQ1
 tUcsp8MNwR9T0VuysE2TGb6adxD5l8PCgpYpc5negRMwWIFCA5mljAwVUOmtQ7CjyReycl9uY
 CvoXSn1Ehi3/LatxaOyqvRI1Qw9MTKUS6a1BqkUY+6AowpH0kPQvUW3ModWMXkBkzpFWxZinS
 9bs668hW/L1RH2uYKzjSl/QOXU1eirknKG6W1WXtSfliB+Jks4+nYTP81GrVPs+6FtWJw5d+v
 sF9jjBoKfnghngihNhQKXXKbkbYX80EZtR8p7DRBZLZGpFKaQone2wAqmIKG+z30KR4RPzaBw
 LRGI01/skYob84KzASpZc9hgKWhRkbGSF61VNsZ7R87oXrNy/w04bz+HgeYTROOZykb7csn11
 heNtnEQqdE3fRf0QaIndOiXlkdYF7TsXogbUaJ/MJV0GHnkRA1LoI2mIDR25s0sAewRUeuFe7
 0vSLlewtIZz+12JStq+b0tkrEUS7RXQhZSz3AdetP9YmN9OLpFCprLo3yIMtLH3mufPdl/H6+
 oH9E3NgtJdX6Ngoy1V+Ltdhs2vcCTJF4o8jrvC3xXeKSobFUBxSBiYMsPK7W5s9Y0efjHwNJ0
 2b219PP5Us5PwT3gow4pnSuLfpLABF8/vNwVDfhYxAIzF2BYKCxN/X2/GBxkJDS36Ql1zu3MP
 n3BcPza5o/IMrezKJpipjsxSLiZoYwTS+4dM8V3WFcMQmUzz9L6Fc/z32kfWK62gCPLyDe

On Wed Nov 11, 2026 at 10:06 AM CET, Thorsten Leemhuis wrote:
> On 11/8/26 19:51, Philipp wrote:
>>=20
>> the SD card in the internal Realtek RTS5129 USB card reader
>> (0bda:0129) of my Lenovo V110-15IKB is no longer detected.
>>=20
>> Works:  6.12.116, 7.2.x
>> Broken: 6.18.x, 7.3.3
>>=20
>> On broken kernels rtsx_usb and rtsx_usb_sdmmc load and the platform
>> devices rtsx_usb_sdmmc.0.auto / rtsx_usb_ms.1.auto exist, but no
>> mmc host/card appears (no mmc0, no mmcblk0) and there are no errors
>> in dmesg. Reloading rtsx_usb / rtsx_usb_sdmmc, re-inserting the card
>> and disabling USB autosuspend (power/control=3Don) do not help.
>>=20
>> Since 7.2.x worked but 6.18.x does not, I suspect a change that was
>> backported to stable.
>
> Might, but might not -- and I wonder if you have two bugs, some race, or
> if some .config setting is disturbing something. Overall this situations
> is somewhat puzzling. The best way to bring some light into this is afaic=
s:
>
> Check if 7.2 is working; if it is, bisect between that and 7.3.3; of
> not, bisect between 7.2 and 7.2.x to find what fixes things. And ensure
> to use the same .config as a base during the bisection, as explained here=
:
> https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.ht=
ml
>
> dmesg outputs from a working and a not-that-different version that is
> broken (say 7.2 and 7.3.3) would be helpful, too.
>
> Ciao, Thorsten

Here are the relevant parts. Both kernels are NixOS builds from
nearly the same nixpkgs revision (Nov 5 vs. Nov 7), same config
generator, same hardware, card inserted during boot.

7.2.15 (works):

[    4.127442] usb 1-9: New USB device found, idVendor=3D0bda, idProduct=3D=
0129, bcdDevice=3D39.60
[    4.142705] usbcore: registered new interface driver rtsx_usb
[    5.580725] mmc0: new high speed SD card at address b368
[    5.622983] mmcblk0: mmc0:b368 SD 1.90 GiB

7.3.3 (broken):

[    4.128601] usb 1-9: New USB device found, idVendor=3D0bda, idProduct=3D=
0129, bcdDevice=3D39.60
[    4.143802] usbcore: registered new interface driver rtsx_usb

After that, nothing card related shows up at all on 7.3.3 -- no
mmc0, no errors, no timeouts. The rest of both logs is essentially
identical. Full logs available if needed.

To sum up what I tested:

  works:  6.12.116, 6.12.117, 7.2.11 - 7.2.15
  broken: 6.18.62, 7.3.1, 7.3.3

Since 7.2.15 works but 6.18.62 does not, my guess is that the
culprit went into 7.3 and was then backported to 6.18.y, but never
made it to 7.2.y before it went EOL.

Next I'll check vanilla 7.2 and then bisect v7.2..v7.3 as you
suggested. Builds take a while here, so this may take some days.

Philipp
